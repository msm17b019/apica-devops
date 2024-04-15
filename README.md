# Project Apica-DevOps

Operating System: Ubuntu 22.04.4 LTS

## Goals:

1. Create a Docker image for the React application.
2. Deploy the Docker image to the Kubernetes cluster.

## Prerequisites:

1. Docker must be installed.
2. MicroK8s is required for running Kubernetes locally.

## React Todo List Application

This project uses a simple Todo List application built with React. You can find the source code for the application in the [React-Todo-list](https://github.com/MaheshRautrao/React-Todo-list?ref=reactjsexample.com) repository.

## Steps:

1. Clone this repository:

    ```
    git clone https://github.com/msm17b019/apica-devops.git
    ```

2. Navigate to the root folder of the repository:

    ```
    cd apica-devops
    ```

3. Run the Docker build command to create a Docker image:

    ```
    docker build . -t myapp
    ```

4. Start the MicroK8s cluster.
5. Load the above docker image to microk8s.

    ```
    docker save myapp > myapp.tar
    microk8s ctr image import myapp.tar
    ```

6. Apply the manifest files from the microk8s directory:

    ```
    microk8s kubectl apply -f microk8s/
    ```

7. Check the NodePort assigned to the todo service. Note the NodePort number listed under the "PORT(S)" column.

    ```
    microk8s kubectl get svc todo
    ```

8. Open your browser and navigate to localhost:<NodePort-number>. Replace <NodePort-number> with the actual NodePort number noted from the previous step.

For example, if the NodePort number is 32123, you would navigate to localhost:32123 in your browser.

This should open up your React Todo List application in the browser.

![alt app](https://github.com/msm17b019/apica-devops/blob/master/img/app.png)

## References:

- https://microk8s.io/
- https://docs.docker.com/engine/install/ubuntu/
