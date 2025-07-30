trait A {
    // Abstract function: must be implemented
    abstract fun f(): Int;
}

trait B with A {
    // Provide an override for f
    override fun f(): Int {
        return 10;
    }
}

trait C with A {
    // Provide a different override for f
    override fun f(): Int {
        return 20;
    }
}

contract X() with B, C {
    // Due to conflicting implementations of f from B and C,
    // the contract must override f explicitly.
    override fun f(): Int {
        // For testing, return 30.
        return 30;
    }
    
    receive() {
        dump(self.f()); // Expect to dump 30
        cashback(sender());
    }
}
