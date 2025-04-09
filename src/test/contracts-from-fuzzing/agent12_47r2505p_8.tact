trait A {
    // Virtual function with a default implementation
    virtual fun f(x: Int): Int {
        return x + 1;
    }
}

trait B with A {
    // No override, inherits A.f
}

trait C with A {
    // Override f in trait C
    override fun f(x: Int): Int {
        return x + 2;
    }
}

contract D() with B, C {
    // Due to diamond inheritance, there is a conflict in the default of f.
    // We explicitly resolve it by overriding f in contract D.
    override fun f(x: Int): Int {
        return x + 3; // expected: call using D.f, so for x=10 result should be 13
    }

    receive() {
        let res = self.f(10);
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            bounce: false,
            body: res.toString().asComment()
        });
    }
}
