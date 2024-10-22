import requests
import time
import threading
import json

# Configurable settings
DOMAIN = "https://inference.genmind.ch"
CHAT_COMPLETIONS_ENDPOINT = f"{DOMAIN}/v1/chat/completions"
GENERATE_ENDPOINT = f"{DOMAIN}/generate"
HEADERS = {'Content-Type': 'application/json'}
CALLS_PER_SECOND = 10  # Change this value to configure the number of calls per second

# # Chat completions request payload
# chat_payload = {
#     "model": "tgi",
#     "messages": [
#         {"role": "system", "content": "You are a helpful assistant."},
#         {"role": "user", "content": "What is deep learning?"}
#     ],
#     "stream": True,
#     "max_tokens": 100
# }

# Generate request payload
generate_payload = {
    "inputs": "What is Deep Learning?",
    "parameters": {
        "max_new_tokens": 100
    }
}



# def make_chat_completion_call():
#     try:
#         response = requests.post(CHAT_COMPLETIONS_ENDPOINT, headers=HEADERS, data=json.dumps(chat_payload))
#         print(f"Chat Completion Response: {response.status_code} - {response.text}")
#     except Exception as e:
#         print(f"Error in Chat Completion Call: {e}")

def make_generate_call():
    try:
        response = requests.post(GENERATE_ENDPOINT, headers=HEADERS, data=json.dumps(generate_payload))
        print(f"Generate Call Response: {response.status_code} - {response.text}")
    except Exception as e:
        print(f"Error in Generate Call: {e}")

def alternating_calls():
    while True:
        # make_chat_completion_call()
        # time.sleep(1 / CALLS_PER_SECOND)
        make_generate_call()
        time.sleep(1 / CALLS_PER_SECOND)

if __name__ == "__main__":
    # Run alternating calls in a separate thread
    thread = threading.Thread(target=alternating_calls)
    thread.start()
