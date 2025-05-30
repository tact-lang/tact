contract TestSend() {
    receive() {
         send(SendParameters{
             to: sender(),
             value: ton("0.05"),
             mode: SendRemainingBalance,
             bounce: false,
             body: "test".asComment()
         });
    }
}
