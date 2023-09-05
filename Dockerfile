# Use the official Ubuntu base image
FROM ubuntu

# Update package lists and install OpenJDK 11
RUN apt update -y && \
    apt install -y openjdk-11-jdk

# Create a directory for Tomcat installation
RUN mkdir /opt/tomcat

# Set the working directory to /opt/tomcat
WORKDIR /opt/tomcat

# Download and extract Apache Tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.80/bin/apache-tomcat-9.0.80.tar.gz .

# Extract the downloaded Tomcat archive
RUN tar -xvzf apache-tomcat-9.0.80.tar.gz

# Move Tomcat files to the correct directory
RUN mv apache-tomcat-9.0.80/* /opt/tomcat

# Expose port 8080 for Tomcat and port 8000 for Java Debugging (optional)
EXPOSE 8080
EXPOSE 8000

# Start Tomcat using catalina.sh when a container is run
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
