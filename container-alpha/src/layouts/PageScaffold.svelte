<script>
	let active
	let route
</script>

<nav>
	<ul>
		<li><a href="/">Home</a></li>
		<li><a href="/faceTool">Face Comparison Tool</a></li>
		<!-- <li><a href="/contact" >Contact</a></li> -->
	</ul>
</nav>

<slot name="placeholder" />

<h2>Created by Matthew with help from ChatGPT</h2>
<h4>Powered by <a href="https://astro.build/">Astro</a></h4>

<style>
	nav {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		background-color: #333;
		color: #fff;
		padding: 10px;
	}

	ul {
		list-style: none;
		margin: 0;
		padding: 0;
		display: flex;
	}

	li {
		margin-right: 20px;
	}

	a {
		color: #fff;
		text-decoration: none;
	}
</style>
