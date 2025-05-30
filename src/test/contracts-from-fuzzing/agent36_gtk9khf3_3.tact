trait A {
    // Abstract function f
    abstract fun f(x: Int): Int;

    // Abstract constant constA must be provided by implementers
    abstract const constA: Int;
}

trait B {
    // Virtual function h with a default implementation
    virtual fun h(x: Int): Int {
        return x * 3;
    }

    // Virtual constant constB with default value
    virtual const constB: Int = 50;
}

contract Test2() with A, B {
    // Override abstract function f from trait A
    override fun f(x: Int): Int {
        return x + 5;
    }

    // Override abstract constant constA from trait A
    override const constA: Int = 7;

    // Do not override h and constB, so defaults from trait B apply

    receive() {
        // Test calls via self to verify the trait composition
        let r1 = self.f(2);      // expected 2 + 5 = 7
        let r2 = self.h(2);      // expected 2 * 3 = 6
        let cA = self.constA;    // expected 7
        let cB = self.constB;    // expected 50

        dump(r1);
        dump(r2);
        dump(cA);
        dump(cB);
        return;
    }
}
