extends fun plusOne(self: Int): Int {
    return self + 1;
}

contract TestPlusOne {
    receive() {
        let a = (10).plusOne(); // expected 11
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            bounce: false,
            body: a.toString().asComment()
        });
    }
}
