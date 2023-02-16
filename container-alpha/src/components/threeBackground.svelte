<script>
	import { onMount } from 'svelte'
	import THREE,{
		Scene,
		PerspectiveCamera,
		AmbientLight,
		DirectionalLight,
		Cube,
		Renderer,
	} from 'three'

	const camera = new PerspectiveCamera(
		75,
		window.innerWidth / window.innerHeight,
		0.1,
		1000
	)
	camera.position.z = 5

	const ambientLight = new AmbientLight(0xffffff, 0.5)
	const directionalLight = new DirectionalLight(0xffffff, 0.5)
	directionalLight.position.set(5, 3, 5)

	let cube

	function init() {
		const scene = new Scene()
		scene.add(ambientLight)
		scene.add(directionalLight)

		cube = new Cube(1, 1, 1, { color: 0xff0000 })
		scene.add(cube)

		const renderer = new Renderer({ antialias: true })
		renderer.setSize(window.innerWidth, window.innerHeight)
		document.querySelector('#three-container').appendChild(renderer.domElement)

		function animate() {
			requestAnimationFrame(animate)
			cube.rotation.x += 0.01
			cube.rotation.y += 0.01
			renderer.render(scene, camera)
		}

		animate()
	}

	onMount(async () => {
		if (document.readyState !== 'complete') {
			await new Promise(() => {
				window.addEventListener('load', () => {
					init()
				})
			})
		} else {
			init()
		}
	})
</script>

{#if !window}
	<div id="placeholder" />
{:else}
	<div id="three-container" />
{/if}

<style>
	#three-container {
		position: absolute;
		top: 0;
		left: 0;
		bottom: 0;
		right: 0;
		background-color: blue;
	}

	#placeholder {
		display: flex;
		justify-content: center;
		align-items: center;
		font-size: 1.5rem;
		height: 100vh;
		width: 100vw;
	}
</style>
