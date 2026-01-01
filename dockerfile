FROM ubuntu:latest

# Install Apache and tools
RUN apt-get update && \
    apt-get install -y apache2 apache2-utils wget unzip && \
    apt-get clean

# Set working directory
WORKDIR /var/www/html

# Download the template and name the downloaded file
RUN wget https://templatemo.com/download/templatemo_597_neural_glass -O template.zip

# Extract and copy files
RUN unzip template.zip && \
    cp -rvf templatemo_597_neural_glass/* . && \
    rm -rvf template.zip templatemo_597_neural_glass

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
