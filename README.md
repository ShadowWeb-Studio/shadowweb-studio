# ShadowWeb Studio

A responsive digital-studio website built with React, Vite, Tailwind CSS and optional Supabase integration.

## Included

- Home, Services, Work, About and Contact pages
- Responsive navigation and mobile layout
- Project and service showcase content
- Contact enquiry form
- Supabase PostgreSQL schema with Row Level Security
- Supabase Auth-based admin sign-in
- Admin dashboard for viewing submitted enquiries
- Local fallback: if Supabase is not configured, the contact form prepares an email draft using the visitor's mail app

## Requirements

Install Node.js LTS from https://nodejs.org/ and use a terminal in this project folder.

## Run locally

```bash
npm install
npm run dev
```

Open the local URL printed by Vite (usually http://localhost:5173).

## Connect Supabase (optional)

1. Create a project at https://supabase.com/ (review the current age and account terms; ask a parent/guardian to manage any account if required).
2. Open **SQL Editor** in the Supabase dashboard.
3. Run the contents of `supabase/schema.sql`.
4. In Supabase Authentication, create an administrator user. Do not enable public sign-up for a private admin dashboard.
5. Copy the project URL and publishable/anon key from the Supabase project API settings.
6. Copy `.env.example` to `.env` and fill in:

```env
VITE_SUPABASE_URL=https://YOUR_PROJECT.supabase.co
VITE_SUPABASE_ANON_KEY=YOUR_SUPABASE_PUBLISHABLE_OR_ANON_KEY
```

7. Restart the dev server. Visit `/admin` and sign in.

### Important security note

The anon/publishable key is designed for browser use when Row Level Security is correctly configured. Never put a Supabase `service_role` key, database password, or other secret in a `VITE_` variable or frontend code.

The included read policy permits authenticated users to read enquiries. Before accepting real customer data, tighten it to the specific administrator UUID as described in `supabase/schema.sql`. Add rate limiting / CAPTCHA or another abuse-control layer before public production use.

## Build for deployment

```bash
npm run build
npm run preview
```

The production output is in `dist/`. You can deploy the project to a static host such as Vercel after reviewing its current account age requirements and involving a parent/guardian where required.

## Before launch

- Replace sample project descriptions with accurate details and screenshots.
- Add a real contact email you control; the fallback currently uses `hello@shadowweb.studio` as a placeholder.
- Add a privacy notice and retention process before collecting personal information.
- Verify all prices, service claims and project statuses.
- Test the contact form, admin access and database policies.
- Do not advertise security testing as a service until appropriately trained and only perform authorised work.
