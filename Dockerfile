FROM openjdk:21-jre-slim

WORKDIR /app

# Paper server download
RUN wget -O server.jar https://api.papermc.io/v2/projects/paper/versions/1.20.4/builds/497/downloads/paper-1.20.4-497.jar

# EULA accept
RUN echo "eula=true" > eula.txt

# Server properties copy
COPY server.properties .

EXPOSE 25565

CMD ["java", "-Xmx1400m", "-Xms1400m", "-XX:+UseG1GC", "-XX:MaxGCPauseMillis=50", "-jar", "server.jar", "--nogui"]
