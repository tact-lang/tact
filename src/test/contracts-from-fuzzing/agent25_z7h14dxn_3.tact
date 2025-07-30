trait TraitA {
    // Virtual function with default implementation
    virtual fun f(): Int {
        return 10;
    }
}

trait TraitC with TraitA {
    // Virtual function that uses f() from TraitA
    virtual fun g(): Int {
        return self.f() + 1;
    }
}

contract TestContract() with TraitC {
    // Override f() to change the behavior
    override fun f(): Int {
        return 42;
    }

    receive() {
        // Calling virtual functions f() and g(); g() uses the overridden f()
        let a: Int = self.f();  // expected to be 42
        let b: Int = self.g();  // expected to be 42 + 1 = 43
        let _ = a + b;         // dummy usage
    }
}
