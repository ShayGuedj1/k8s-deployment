docker build -t stephengrider/multi-client:latest -t sharagon1/multi-client -f ./client/Dockerfile ./client
docker build -t stephengrider/multi-server:latest -t sharagon1/multi-server -f ./server/Dockerfile ./server
docker build -t stephengrider/multi-worker:latest -t sharagon1/multi-worker -f ./worker/Dockerfile ./worker

docker push stephengrider/multi-client:latest
docker push stephengrider/multi-server:latest
docker push stephengrider/multi-worker:latest

docker push stephengrider/multi-client:1.1
docker push stephengrider/multi-server:1.1
docker push stephengrider/multi-worker:1.1

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=stephengrider/multi-server:latest
kubectl set image deployments/client-deployment client=stephengrider/multi-client:latest
kubectl set image deployments/worker-deployment worker=stephengrider/multi-worker:latest
