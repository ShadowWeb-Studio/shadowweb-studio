-- Run this SQL in Supabase Dashboard > SQL Editor.
-- Public visitors can submit enquiries. Only authenticated admins can read them.
create extension if not exists pgcrypto;

create table if not exists public.enquiries (
  id uuid primary key default gen_random_uuid(),
  name text not null check (char_length(name) between 1 and 80),
  email text not null check (char_length(email) between 3 and 160),
  service text not null,
  budget text,
  message text not null check (char_length(message) between 10 and 3000),
  status text not null default 'new' check (status in ('new','reviewing','replied','closed')),
  created_at timestamptz not null default now()
);

alter table public.enquiries enable row level security;

drop policy if exists "Anyone can submit an enquiry" on public.enquiries;
create policy "Anyone can submit an enquiry"
on public.enquiries for insert
to anon, authenticated
with check (
  char_length(name) between 1 and 80
  and char_length(email) between 3 and 160
  and char_length(message) between 10 and 3000
);

drop policy if exists "Authenticated admins can read enquiries" on public.enquiries;
create policy "Authenticated admins can read enquiries"
on public.enquiries for select
to authenticated
using (auth.uid() is not null);

-- No public update/delete policies are created.
-- For a real business, restrict SELECT to a specific admin user UUID
-- using: auth.uid() = 'YOUR-ADMIN-USER-UUID'::uuid
