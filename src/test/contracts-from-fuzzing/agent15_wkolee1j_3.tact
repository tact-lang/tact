contract TestMessage {
    receive() {
        // This is a minimal test for the message() standard library function
        // It sends an internal message back to the sender with a test body
        message(MessageParameters{
            to: sender(),
            value: ton("0.1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Test message".asComment()
        });

        // Also test send() if available via alias, but since documentation mentions message() and cashback() more, we'll test cashback() as send variant
        cashback(sender());
    }
}

// Dummy contract to ensure TestMessage compiles and its receiver is used
contract DummyReceiver {
    receive() {
        // Trigger TestMessage by calling its receiver via message sending
        // Instead of instantiating the contract (unsupported), we simply call cashback() as a placeholder
        cashback(sender());
    }
}
