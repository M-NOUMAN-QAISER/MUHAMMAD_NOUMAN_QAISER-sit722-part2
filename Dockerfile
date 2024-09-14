
# Use the official Python 3.11 image from Docker Hub, based on a slim version for a smaller footprint
FROM python:3.11-slim

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the contents of the local book_catalog directory into the /app directory in the container
COPY ./book_catalog .

# Install the Python packages listed in the requirements.txt file
RUN pip install -r requirements.txt

# Expose port 8081 to allow communication to/from the container on this port
EXPOSE 8081

# Set the default command to run when the container starts
# This command runs the Uvicorn server, serving the ASGI app defined in main:app
# --host 0.0.0.0 makes the app accessible from outside the container
# --port 8081 specifies the port on which the app will run
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8081"]
