contract TestSendBounce {
    receive() {
        // Send a message explicitly with bounce set to false
        send(SendParameters{
            to: sender(),
            value: ton("0.01"),
            mode: SendRemainingBalance,
            bounce: false,
            body: "Testing bounce false".asComment()
        });
    }
}

// Dummy contract for completeness
contract Dummy {}