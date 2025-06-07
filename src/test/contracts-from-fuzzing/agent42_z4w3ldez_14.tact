trait A {
    // Virtual function f returning 1 by default
    virtual fun f(): Int {
        return 1;
    }
}

trait B with A {
    // Virtual function g using f from the inherited trait
    virtual fun g(): Int {
        return self.f() + 10;
    }
}

contract D() with B {
    // Override function f to return 5
    override fun f(): Int {
        return 5;
    }

    receive() {
        // g should return self.f() + 10 = 5 + 10 = 15
        dump(self.g());
        cashback(sender());
    }
}
