<script lang="ts">
	import { page } from '$app/state';
	import { IconUserCircle } from '@tabler/icons-svelte';

	let { children } = $props();
</script>

<div class="app-grid bg-gradient-to-br from-pink-100 to-purple-100">
	<nav class="bg-white shadow-lg">
		<div class="mx-auto max-w-7xl px-4">
			<div class="h-18 flex justify-between">
				<div class="flex items-center">
					<a
						href="/"
						class="text-2xl font-bold text-pink-500"
						aria-current={page.url.pathname === '/'}>BuddyCam</a
					>
				</div>
				<div class="ml-6 flex items-center gap-6">
					<a href="/profile" aria-current={page.url.pathname === '/profile'} class="text-rose-500">
						<IconUserCircle class="m-auto h-8 w-8 -translate-y-0.5"></IconUserCircle>
					</a>
				</div>
			</div>
		</div>
	</nav>

	<section class="overflow-y-auto">
		{@render children()}
	</section>
</div>

<style>
	nav {
		view-transition-name: header;
	}

	.app-grid {
		display: grid;
		grid-template-rows: auto 1fr;
		height: 99.6svh;
	}

	a {
		position: relative;
		min-width: 3rem;
	}

	a[aria-current='true']::after {
		position: absolute;
		content: '✨';
		--col: currentColor;
		background: linear-gradient(
			90deg,
			var(--col) 0%,
			var(--col) calc(100% - 1.5rem),
			transparent calc(100% - 1rem),
			transparent 100%
		);
		bottom: -0.3rem;
		left: calc(70% - 0.5rem);
		display: flex;
		transform: translateX(-50%);
		width: 100%;
		direction: rtl;
		line-height: 0.3rem;
		height: 0.2rem;
		font-size: 0.7rem;
		border-radius: 0.25rem;
		view-transition-name: active-link;
	}
</style>
