contract TestSend() {
    receive() {
         // Test the send() function using SendParameters.
         // This should queue an outbound message with 1 Toncoin, sending a simple comment as the message body.
         send(SendParameters{
             to: sender(),
             value: ton("1"),
             mode: SendIgnoreErrors, // using SendIgnoreErrors flag to ignore action phase errors
             bounce: true,
             body: "Hello, from send()".asComment()
         });
    }
}
