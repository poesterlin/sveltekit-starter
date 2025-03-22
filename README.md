# Sveltekit Starter Pack

My personal Sveltekit Setup.

Includes:

- Drizzle ORM
- Tailwind CSS
- Auth + Redirects
- Basic Routes
- Action Schema Validation
- Toasts
- Docker Setup + Traefik
- Deploy Script
- Service Worker
- Helpers

## Setup

Init a new project with the following command:

```powershell
iwr 'https://raw.githubusercontent.com/poesterlin/sveltekit-starter/main/init-from-template.ps1' | iex
```

Copy the `.env.example` file to a `.env` file and update the values.

## Versions

- Default: `iwr 'https://raw.githubusercontent.com/poesterlin/sveltekit-starter/main/init-from-template.ps1' | iex`
- No Auth: `iwr 'https://raw.githubusercontent.com/poesterlin/sveltekit-starter/no-auth/init-from-template.ps1' | iex`

## Usage

```bash
bun install
bun run dev
```

## TODO

- [ ] Google Login Routes
- [ ] Tailwind theme colors
- [ ] Documentation
