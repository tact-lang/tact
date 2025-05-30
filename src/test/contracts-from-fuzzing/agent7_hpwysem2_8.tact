trait A {
    // Abstract function f
    abstract fun f(): Int;

    // Virtual function g returns f() + 5
    virtual fun g(): Int {
        return self.f() + 5;
    }
}

// Trait B inherits from A and overrides f
trait B with A {
    override fun f(): Int {
        return 7;
    }
}

contract C() with B {
    receive() {
        // f() should return 7 from trait B
        require(self.f() == 7, "f() did not return 7");
        // g() should return 7 + 5 = 12
        require(self.g() == 12, "g() did not return 12");
        cashback(sender());
    }
}
