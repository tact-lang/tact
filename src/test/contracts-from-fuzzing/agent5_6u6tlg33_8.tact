trait TA {
    abstract fun foo(): Int;
}

trait TB {
    abstract fun foo(): Int;
}

contract C() with TA, TB {
    override fun foo(): Int {
        return 123;
    }

    receive() {
        let r = self.foo();
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: r.toString().asComment()
        });
    }
}
