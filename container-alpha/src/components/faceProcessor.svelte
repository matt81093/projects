<script>
	import * as tf from '@tensorflow/tfjs'
	import cv from '@techstark/opencv-js'

	let img1 = null
	let img2 = null

	const loadAndPreprocessImage = async (img) => {
		const model = await tf.loadGraphModel(
			'https://tfhub.dev/google/imagenet/mobilenet_v2_100_224/feature_vector/4'
		)
		const image = await cv.imread(img)
		const tensor = tf.browser.fromPixels(image)
		const features = await model.predict(tensor.expandDims()).array()
		return { width: image.cols, height: image.rows, features }
	}

	const highlightFaces = async (img) => {
		const { width, height, features } = await loadAndPreprocessImage(img)
		const predictions = features[0]
		const boxes = predictions.map((prediction) => {
			const box = prediction.box.slice()
			box[0] *= width
			box[1] *= height
			box[2] *= width
			box[3] *= height
			return box
		})

		const outputCanvas = document.getElementById('outputCanvas')
		const outputCtx = outputCanvas.getContext('2d')
		outputCtx.clearRect(0, 0, outputCanvas.width, outputCanvas.height)
		boxes.forEach((box) => {
			outputCtx.beginPath()
			outputCtx.lineWidth = '2'
			outputCtx.strokeStyle = 'blue'
			outputCtx.rect(box[0], box[1], box[2] - box[0], box[3] - box[1])
			outputCtx.stroke()
		})
	}

	const compareImages = async () => {
		const { features: features1 } = await loadAndPreprocessImage(img1)
		const { features: features2 } = await loadAndPreprocessImage(img2)
		const distance = tf
			.norm(tf.sub(tf.tensor(features1), tf.tensor(features2)))
			.arraySync()
		const outputCanvas = document.getElementById('outputCanvas')
		const outputCtx = outputCanvas.getContext('2d')
		outputCtx.clearRect(0, 0, outputCanvas.width, outputCanvas.height)
		outputCtx.font = '48px Arial'
		outputCtx.fillStyle = 'black'
		outputCtx.fillText(`Distance: ${distance.toFixed(2)}`, 10, 50)
	}
</script>

<div>
	<h1>Highlight Facial Characteristics and Compare Images</h1>
	<p>Select two images to compare:</p>
	<input type="file" accept="image/*" bind:files={$img1} />
	<input type="file" accept="image/*" bind:files={$img2} />
	<button on:click={() => highlightFaces(img1)}>Highlight Faces</button>
	<button on:click={compareImages}>Compare Images</button>
	<canvas id="outputCanvas" />
</div>

<style>
	canvas {
		width: 100%;
		height: 300px;
	}
</style>
