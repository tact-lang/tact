contract TestSend {
    receive() {
        // Test send() with SendParameters: sends a message back to sender with a simple comment
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            bounce: true,
            body: "Test send".asComment()
        });
        
        // Additionally, forward any remaining balance with cashback for completeness
        cashback(sender());
    }
}

// Dummy contract to ensure TestSend receiver is compiled
contract DummyReceiver {
    receive() {
        // Trigger TestSend behavior indirectly
        cashback(sender());
    }
}
