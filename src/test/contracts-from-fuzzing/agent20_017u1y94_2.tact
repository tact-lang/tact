trait A {
    virtual fun f(): Int {
        return 1;
    }
}

trait B with A {
    override fun f(): Int {
        return 2;
    }
}

contract C() with B {
    // Getter to check the value of f()
    get fun test(): Int {
        return self.f();
    }

    // A receiver function to satisfy compilation
    receive() {}
}
