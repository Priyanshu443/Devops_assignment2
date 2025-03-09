# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install Python and dependencies
RUN apt update && apt install -y python3 python3-pip python3-venv

# Set working directory
WORKDIR /app

# Copy the application files
COPY . /app

# Create a virtual environment and install dependencies
RUN python3 -m venv venv && \
    /app/venv/bin/pip install --no-cache-dir -r requirements.txt

# Expose port 8000
EXPOSE 8000

# Run the FastAPI server using the virtual environment
CMD ["/app/venv/bin/python", "-m", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
