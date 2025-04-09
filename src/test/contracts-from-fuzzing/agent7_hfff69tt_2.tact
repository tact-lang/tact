contract TestMessage() {
    receive() {
         message(MessageParameters{
             to: myAddress(),
             value: ton("0.01"),
             mode: SendRemainingValue | SendIgnoreErrors,
             body: "Hello".asComment(),
             bounce: false
         });
    }
}
