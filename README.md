<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
</head>
<body>

  <h1>Python Monitoring App with Docker and Azure</h1>

  <p>Welcome to my Github repository! In this project, I've built a Python application that monitors system resources using Flask and psutil libraries. You can run the app locally on your machine, or containerize it with Docker and deploy it to the cloud using Azure Container Registry (ACR).</p>

  <h2>Running the App Locally</h2>

  <p>To run the Python app locally, you'll need to have Python 3 installed on your machine. You can download it from the <a href="https://www.python.org/downloads/">official website</a>.</p>

  <p>Then, clone this repository to your local machine:</p>

  <pre><code>git clone https://github.com/your-username/your-repo.git
  cd your-repo</code></pre>

  <p>Install the required Python packages by running:</p>

  <pre><code>pip install -r requirements.txt</code></pre>

  <p>Finally, start the app by running:</p>

  <pre><code>python app.py</code></pre>

  <p>The app will start running on <code>http://localhost:5000/</code> and you should be able to see the resource usage of your system by accessing the <code>/monitor</code> endpoint.</p>

  <h2>Containerizing the App with Docker</h2>

  <p>If you want to containerize the Python app with Docker, you can use the <code>Dockerfile</code> provided in this repository. Here's how you can do it:</p>

  <ol>
    <li>Make sure you have Docker installed on your machine. You can download it from the <a href="https://www.docker.com/products/docker-desktop">official website</a>.</li>
    <li>Build the Docker image from the <code>Dockerfile</code> by running:

      <pre><code>docker build -t your-image-name .</code></pre>

      <p>This will create a Docker image with the name <code>your-image-name</code> and the current directory (<code>.</code>) as the build context.</p>
    </li>
    <li>Run the Docker container from the image by running:

      <pre><code>docker run -p 5000:5000 your-image-name</code></pre>

      <p>This will start a Docker container and map port 5000 inside the container to port 5000 on your local machine.</p>

      <p>You can access the running container by opening <code>http://localhost:5000/</code> in your web browser.</p>
    </li>
  </ol>

  <h2>Deploying the App to Azure Container Registry</h2>

  <p>To deploy the Dockerized Python app to Azure Container Registry (ACR), you can use the Azure Bicep and JSON files provided in this repository. Here's how you can do it:</p>

  <ol>
    <li>Make sure you have an Azure subscription and have logged in to Azure using the <a href="https://docs.microsoft.com/en-us/cli/azure/install-azure-cli">Azure CLI</a>.</li>
    <li>Create a new Azure Container Registry by running:

      <pre><code>az deployment group create --
