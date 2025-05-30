contract TesterSendRemaining() {
    receive() {
        // Test send() with SendRemainingValue and SendIgnoreErrors flags
        send(SendParameters{
            to: sender(),
            value: 0, // zero value, but mode will append remaining value
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Remaining value mode test".asComment()
        });
        // Forward any remaining funds back to sender
        cashback(sender());
    }
}
