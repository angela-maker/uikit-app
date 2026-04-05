import os
from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/', methods=['POST'])
def on_event():
    """Handles incoming chat events."""
    event = request.get_json()
    print(event) # Log the event for debugging

    if event['type'] == 'ADDED_TO_SPACE':
        return jsonify({'text': 'Thanks for adding me!'})
    elif event['type'] == 'MESSAGE':
        return handle_message(event)
    else:
        return jsonify({})

def handle_message(event):
    """Handles MESSAGE events."""
    message_text = event['message']['text'].lower()

    # Simple "Hello World" card response
    if 'hello' in message_text:
        card = {
            "cardsV2": [
                {
                    "cardId": "helloCard",
                    "card": {
                        "header": {
                            "title": "Hello from uikit-app!",
                            "subtitle": "Basic Card Demo"
                        },
                        "sections": [
                            {
                                "widgets": [
                                    {
                                        "textParagraph": {
                                            "text": "This is a simple UI Kit card generated on the fly."
                                        }
                                    }
                                ]
                            }
                        ]
                    }
                }
            ]
        }
        return jsonify(card)
    else:
        return jsonify({'text': 'You said: ' + event['message']['text']})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))

