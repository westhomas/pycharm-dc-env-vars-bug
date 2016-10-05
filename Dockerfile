FROM  ubuntu:14.04
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-get install -y build-essential
RUN apt-get install -y python-dev
RUN add-apt-repository -y ppa:fkrull/deadsnakes
RUN apt-get update
RUN apt-get install -y python3.5 python3.5-dev


# Upgrade PIP on Python 3 so installing python-requests doesn't break everything.
ADD https://bootstrap.pypa.io/get-pip.py /tmp/get-pip.py
RUN python3 /tmp/get-pip.py
RUN python /tmp/get-pip.py

# Upgrade setuptools so entry points will work
RUN pip install -U setuptools
RUN pip3 install -U setuptools

# Upgrade PIP so entry points will work
RUN pip install -U pip
RUN pip3 install -U pip

# Fix InsecurePlatformWarning on Python < 3
#RUN pip install requests[security]

# Install IPython
RUN pip install ipython
RUN pip3 install ipython


ADD requirements.pip /data/requirements.pip
RUN python3 -m pip install -r /data/requirements.pip


WORKDIR /
