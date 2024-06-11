# Serviço 2 - recebe as mensagens via RabbitMQ e as armazena em um banco de dados em memória
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from services.queue import consume_order_queue
import threading

from pika.connection import Parameters
Parameters.DEFAULT_CONNECTION_ATTEMPTS = 10

app = FastAPI()

origins = [
    "http://localhost:3001",
]

# Middleware de CORS (caso necessário)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Executa a aplicação com a informação de HOST e PORTA enviados por argumentos
if __name__ == "__main__":
    import uvicorn
    import os
    # if "RABBITMQ_HOST" in os.environ:
    try:
        # Cria uma thread para receber as mensagens do RabbitMQ
        thread = threading.Thread(target=consume_order_queue)
        thread.start()
        uvicorn.run(app, host="0.0.0.0", port=3001)
    except Exception as e:
        print(f"Finalizando a execução da thread: {e}")
        thread.stop()
else:
    raise Exception("HOST and PORT must be defined in environment variables")