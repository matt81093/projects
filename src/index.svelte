<!-- Landing Page for my Portfolio -->
<script>
  import ThreeBackground from "./components/threeBackground.svelte"
</script>

<head>
	<meta charset="UTF-8" />
	<title>Arcanium</title>
</head>

<body>
	<ThreeBackground />

	<!-- Navigation bar to projects -->
	<nav>
		<ul>
			<li><a href="./pages/faceCompareTool.svelte">Projects</a></li>
		</ul>
	</nav>

	<h1>My First Heading</h1>
	<p>My first paragraph.</p>
</body>

<style>
	/* Styled top nav bar */
	nav {
		background-color: #333;
		color: #fff;
		padding: 0.5em;
		margin-bottom: 1em;
	}

	/* Some simple CSS to make my landing page look a little nicer */
	body {
		font-family: sans-serif;
		font-size: 14px;
		line-height: 1.5;
		color: #333;
		background-color: #f5f5f5;
		padding: 1em;
	}
</style>
