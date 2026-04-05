# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.14

# Allow statements and log messages to stdout to be sent to the Cloud Run logs
# where they can be viewed.
ENV PYTHONUNBUFFERED TRUE

# # Copy local code to the container image.
# ENV APP_HOME /app
# WORKDIR $APP_HOME
# COPY . ./

# # Install production dependencies.
# RUN pip install --no-cache-dir -r requirements.txt

# # Run the web service on container start.
# # Use PORT environment variable, or default to 8080.
# CMD exec gunicorn --bind :${PORT:-8080} --workers 1 --threads 8 --timeout 0 main:app
