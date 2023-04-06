<script>
	let active
	let route
</script>

<nav>
	<ul>
		<li><a href="/">Home</a></li>
		<li><a href="/tools/faceCompare">Face Comparison Tool</a></li>
		<!-- <li><a href="/contact" >Contact</a></li> -->
	</ul>
</nav>

<slot name="placeholder" />

<footer>
	<dir>Created by Matthew with help from ChatGPT</dir>
	<dir>Powered by <a href="https://astro.build/">Astro</a></dir>
</footer>

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

	footer {
		position: fixed;
		bottom: 0;
		left: 0;
		right: 0;
		background-color: #333;
		color: #fff;
		padding: 10px;
		text-align: center;
	}
</style>
