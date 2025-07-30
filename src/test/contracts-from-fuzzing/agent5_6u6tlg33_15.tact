contract RepeatVariableTest() {
    receive() {
        let n = 5;
        repeat(n) {
            // do nothing
        }
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: "Repeat done".asComment()
        });
    }
}
