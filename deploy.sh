docker build -t maping77/multi-client:latest -t maping77/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t maping77/multi-server:latest -t maping77/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t maping77/multi-worker:latest -t maping77/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push maping77/multi-client:latest
docker push maping77/multi-server:latest
docker push maping77/multi-worker:latest
docker push maping77/multi-client:$SHA
docker push maping77/multi-server:$SHA
docker push maping77/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=maping77/multi-client:$SHA
kubectl set image deployments/server-deployment server=maping77/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=maping77/multi-worker:$SHA
