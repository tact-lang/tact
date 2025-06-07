contract TestSend {
    receive() {
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: SendIgnoreErrors,
            body: "Hello via send()".asComment()
        });
    }
}

// A minimal contract to ensure TestSend gets compiled
contract Dummy {}