trait A {
    virtual const X: Int = 5;
}

trait B {
    virtual const X: Int = 10;
}

contract C() with A, B {
    // Provide explicit override for X
    override const X: Int = 42;

    receive() {
        let r = self.X;
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: r.toString().asComment()
        });
    }
}
