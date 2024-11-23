import json

def lambda_handler(event, context):
    """
    Lambda function handler that processes the event and context and returns a response.
    This can be customized based on your use case.
    """

    # Log the received event for debugging purposes
    print(f"Received event: {json.dumps(event)}")

    # Example: Retrieve 'name' from event (e.g., from API Gateway query parameter or body)
    name = event.get('name', 'World')  # Default to 'World' if 'name' is not provided

    # You can add more processing logic here depending on your use case

    # Example: Construct a personalized greeting message
    message = f"Hello, {name}!"

    # Prepare a structured response
    response = {
        "statusCode": 200,  # HTTP status code (200 for success)
        "body": json.dumps({
            "message": message  # Returning the message in the response body
        })
    }

    # Return the response to the caller (API Gateway, other services, etc.)
    return response
