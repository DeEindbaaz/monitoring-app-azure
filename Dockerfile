# use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# set the working directory to /app
WORKDIR /app

# copy the requirements file to the working directory
COPY requirements.txt .

# install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# copy the current directory contents into the container at /app
COPY . /app

# expose port 5000 for the Flask application
EXPOSE 5000

# set the environment variable for Flask to run in production mode
ENV FLASK_ENV=production

# start the Flask application
CMD ["flask", "run", "--host", "0.0.0.0"]
