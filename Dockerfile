FROM jupyter/datascience-notebook

RUN pip install mlflow

RUN mkdir mlflow

EXPOSE 5050/tcp

EXPOSE 5000/tcp

COPY . .

CMD mlflow server \
    --file-store /mlflow \
    --host 0.0.0.0 \
    --port 8787
	
CMD mlflow ui \
	--host 0.0.0.0 \
	--port 5050 \
	&

CMD jupyter notebook \
    --no-browser \
    --ip 0.0.0.0 \
    --port 5000 \
    --allow-root 