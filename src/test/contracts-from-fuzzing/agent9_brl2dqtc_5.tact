contract TesterSendBalance() {
    receive() {
        // Test send() with SendRemainingBalance, SendDestroyIfZero, and SendIgnoreErrors flags
        // This sends the entire contract balance (and destroys the contract if balance becomes zero)
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingBalance | SendDestroyIfZero | SendIgnoreErrors,
            body: "Test remaining balance message".asComment()
        });
        // Forward any remaining funds (if any) back to the sender
        cashback(sender());
    }
}
