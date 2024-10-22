import openai
import time
import threading

# Configurable settings
API_BASE_URL = "https://inference.genmind.ch/v1/"
API_KEY = "your_openapi_key_here"  # Replace with your actual OpenAI API key
CALLS_PER_SECOND = 6  # Change this value to configure the number of calls per second

# Set up OpenAPI client
openai.api_base = API_BASE_URL
openai.api_key = API_KEY

# Generate request payload
generate_payload = {
    "inputs": "What is Deep Learning?",
    "parameters": {
        "max_new_tokens": 500
    }
}

def make_generate_call():
    try:
        # Sending generate request
        response = openai.ChatCompletion.create(
            model="tgi",
            messages=[{"role": "user", "content": generate_payload["inputs"]}],
            max_tokens=generate_payload["parameters"]["max_new_tokens"]
        )
        generated_text = response.choices[0].message["content"].strip()

        # Format the generate request output
        user_input = generate_payload["inputs"]
        print(f'📝 "{user_input}" --> tgi: {generated_text}')
    except Exception as e:
        print(f"❌ Error in Generate Call: {e}")

def alternating_calls():
    while True:
        make_generate_call()
        time.sleep(1 / CALLS_PER_SECOND)

if __name__ == "__main__":
    # Run alternating calls in a separate thread
    thread = threading.Thread(target=alternating_calls)
    thread.start()
