# Use a stable lightweight Python image.
FROM python:3.11-slim

# Allow statements and log messages to stdout to be sent to the Cloud Run logs
ENV PYTHONUNBUFFERED TRUE

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy local code to the container image
COPY . .

# Run the functions framework on container start.
# The target is your function name 'avatar_app'.
# Functions Framework handles the PORT environment variable automatically.
CMD ["functions-framework", "--target=avatar_app"]
