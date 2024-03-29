# Create image based on official python3 image
FROM python:3

# Contact
MAINTAINER Kalu Kalu <kaluemekalu@gmail.com>

# Sets dumping log messages directly to stream instead of buffering
ENV PYTHONUNBUFFERED 1

# Creating and putting configurations
RUN mkdir /config
ADD config/apr /config/

# Installing all python dependencies
RUN pip install -r /config/requirements.txt

# Open port 8000 to outside world
EXPOSE 8000

# When container starts, this script will be executed. 
# Note that it is NOT executed during building
CMD ["sh", "/config/on-container-start.sh"]

# Creating and putting application inside container
# and setting it to workign directory (meaning it is going to be default)
RUN mkdir /apr
WORKDIR /apr
ADD apr /apr/