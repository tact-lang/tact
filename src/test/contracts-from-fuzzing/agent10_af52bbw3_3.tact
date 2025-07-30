contract TestSend() {
    receive() {
         send(SendParameters{
             bounce: true,
             to: sender(),
             value: ton("0.01"),
             body: "Hello from Tact!".asComment()
         });
    }
}
