trait A {
    virtual fun f(): Int { return 1; }
}

trait B with A {
    // Override f() in trait B and call self.f() in its body
    override fun f(): Int { return self.f() + 1; }
}

trait C with A {
    // Override f() in trait C and call self.f() in its body
    override fun f(): Int { return self.f() + 2; }
}

contract D() with B, C {
    // Explicitly resolve ambiguity by overriding f()
    override fun f(): Int { return 10; }

    receive() {
        let result = self.f(); // expected to be 10 from contract D's implementation
        // No runtime behavior check but compilation and resolution works if this compiles
        cashback(sender());
    }
}
