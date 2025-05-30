contract MessageTester() {
    receive() {
         message(MessageParameters{
            to: myAddress(),
            value: ton("1"),
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "Hello".asComment()
         });
         cashback(sender());
    }
}
