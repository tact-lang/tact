extends mutates fun doubleVal(self: Int) {
    self = self * 2;
}

contract TestMutate() {
    receive() {
        let x = 10;
        x.doubleVal();
        // Expected x becomes 20
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: x.toString().asComment(),
        });
    }
}
