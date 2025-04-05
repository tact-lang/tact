trait T1 {
    // Abstract function
    abstract fun foo(): Int;
    // Virtual function with default implementation
    virtual fun bar(): Int { return 100; }

    // Abstract constant: must be overridden
    abstract const A: Int;
    // Virtual constant with default value
    virtual const B: Int = 200;
}

contract C() with T1 {
    // Override abstract function
    override fun foo(): Int { return 42; }

    // Override abstract constant and virtual constant
    override const A: Int = 10;
    override const B: Int = 300;

    // Helper function that accesses the trait members via self
    fun test(): Int {
        return self.foo() + self.bar() + self.A + self.B;
    }

    receive() {
        let result = self.test();
        reply(result.toString());
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
