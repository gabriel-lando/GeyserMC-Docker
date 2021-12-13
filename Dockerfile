# Use OpenJDK latest image
FROM openjdk:latest

# Create data directory 
VOLUME /data
WORKDIR /data

# Download latest version of the GeyserMC
ADD https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/target/Geyser.jar /app/

# Define port number and expose it (Default: 19132 - Minecraft Bedrock server)
ENV PORT=19132
EXPOSE $PORT/udp

# Run GeyserMC with Java
CMD ["java", "-jar", "/app/Geyser.jar"]

# How to run:
# docker build . -t <image-name>
# docker run -d -p 19132:19132/udp -e PORT=19132 -v /<path-to-project>/data:/data --restart unless-stopped --name <container-name> <image-name>
