FROM registry.access.redhat.com/ubi8/ubi:8.1


#### INSTALATION

RUN yum install -y wget

RUN  yum install -y xz

RUN yum clean all

#RUN groupadd jenkins

#RUN useradd -g jenkins newuser

RUN groupadd -g 1000 jenkins && useradd -u 1000 -g jenkins -s /bin/bash -m -d /home/jenkins jenkins

RUN echo  'jenkins:j3nk1ns' | chpasswd


RUN  mkdir /usr/local/lib/node

WORKDIR /usr/local/lib/node

RUN wget https://nodejs.org/dist/v18.20.1/node-v18.20.1-linux-x64.tar.xz

RUN tar -xf  node-v18.20.1-linux-x64.tar.xz

RUN mv /usr/local/lib/node/node-v18.20.1-linux-x64 /usr/local/lib/node/nodejs

ENV NODEJS_HOME=/usr/local/lib/node/nodejs

ENV PATH=$NODEJS_HOME/bin:$PATH

RUN node -v

RUN npm  -v


#### 





USER jenkins


# hacer la carpeta 'app' el directorio de trabajo actual
WORKDIR /app

# copiar 'package.json' y 'package-lock.json' (si están disponibles)
COPY package*.json ./

COPY --chown=newuser:newuser . /app

# instalar dependencias del proyecto
RUN npm install

# copiar los archivos y carpetas del proyecto al directorio de trabajo actual (es decir, la carpeta 'app')
COPY . .

# construir aplicación para producción minificada
RUN npm run build




