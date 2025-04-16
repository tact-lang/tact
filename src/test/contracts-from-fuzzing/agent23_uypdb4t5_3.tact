trait MyTrait {
    // Abstract function: must be overridden by inheriting contracts
    abstract fun foo(): Int;

    // Virtual function: can be optionally overridden to change behavior
    virtual fun bar(): Int {
        return 10;
    }
}

contract TestContract() with MyTrait {
    // Mandatory override for the abstract function foo()
    override fun foo(): Int {
        return 5;
    }

    // Override the virtual function bar() to provide custom behavior
    override fun bar(): Int {
        return 20;
    }

    // A simple receiver that calls both functions and replies with their sum
    receive() {
        let sum = self.foo() + self.bar();
        reply(sum.toString());
    }
}

// Utility inline function to send a text reply as a message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
