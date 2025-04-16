contract MessageTest {
    receive() {
         message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "hello".asComment()
         });
         cashback(sender());
    }
}
