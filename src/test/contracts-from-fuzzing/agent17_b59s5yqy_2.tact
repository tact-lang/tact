contract TestMessage {
    receive() {
        // Using message() to send an internal message with minimal parameters.
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: null
        });
    }
}

// An empty contract to ensure TestMessage is fully compiled
contract Dummy() {}