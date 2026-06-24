contract TestSendComplex() {
    receive() {
        // Test send() with a combination of mode flags: SendRemainingBalance | SendDestroyIfZero
        // These constants are defined in the Tact standard library and are combined using bitwise OR.
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: SendRemainingBalance | SendDestroyIfZero,
            body: "Test complex send".asComment()
        });
        cashback(sender());
    }
}
