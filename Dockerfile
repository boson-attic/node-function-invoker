# Use the UBI minimal image to stay small, and install Node.js
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Install Node.js and tar (needed by odo)
COPY ./nodejs.module /etc/dnf/modules.d
RUN microdnf install -y nodejs tar

# Install stack runtime dependencies
WORKDIR /invoker
COPY ./package.json ./server.js ./
RUN npm install --production --no-package-lock

ENV HOME /projects/node-function
USER 1001

ENV NODE_ENV production
ENV PORT 8080
EXPOSE 8080
CMD ["npm", "start"]
