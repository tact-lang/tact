contract SendTester() {
    receive() {
         // Using send() to send a simple message back to the sender
         send(SendParameters{
             to: sender(),
             value: ton("1"),
             mode: SendRemainingValue | SendIgnoreErrors,
             body: "Test send".asComment()
         });
         cashback(sender());
    }
}
