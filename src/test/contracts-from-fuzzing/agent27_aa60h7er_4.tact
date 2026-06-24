trait A {
    // Virtual function with default implementation in trait A
    virtual fun compute(): Int { return 10; }
}

// Trait B inherits from A and overrides compute
trait B with A {
    override fun compute(): Int { return 20; }
}

contract D() with B {
    // Test function returning the result of compute()
    fun test(): Int {
        return self.compute();
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
