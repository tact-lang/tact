contract TestMessage() {
    receive() {
         // Use the built-in message() function to send a message
         message(MessageParameters{
             to: sender(),
             value: ton("0.05"),
             mode: SendRemainingValue | SendIgnoreErrors,
             bounce: true,
             body: "hello".asComment()
         });
    }
}
