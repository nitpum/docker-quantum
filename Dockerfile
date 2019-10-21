# FROM ubuntu:19.10
FROM continuumio/anaconda3

# Update api-get
RUN apt-get update
RUN apt-get install -y  

# Install python3
RUN apt-get install python3 python3-pip python3-apt python-apt -y
RUN pip3 install pyquil
RUN pip3 install --upgrade pyquil
RUN apt-get install liblapack-dev libblas-dev libffi-dev libzmq3-dev sbcl -y

RUN git clone --recurse-submodules https://github.com/rigetti/quilc.git
RUN make quilc

RUN git clone --recurse-submodules https://github.com/rigetti/qvm.git
RUN make qvm

RUN pip3 install qiskit
RUN pip3 install qiskit-terra[visualization]

CMD ["/bin/bash"]