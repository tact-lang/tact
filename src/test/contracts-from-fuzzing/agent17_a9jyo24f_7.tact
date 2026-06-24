trait A {
    // Abstract function that must be implemented
    abstract fun f(): Int;
    
    // A concrete function that depends on f()
    fun g(): Int {
        return self.f() + 1;
    }
}

trait B with A {
    // Provide an override for f() in trait B
    override fun f(): Int {
        return 5;
    }
}

trait C with A {
    // Provide an override for f() in trait C
    override fun f(): Int {
        return 10;
    }
}

// Contract D inherits both traits B and C, creating a diamond inheritance scenario
// The contract is required to override f() to resolve the conflict
contract D() with B, C {
    // Overriding f() explicitly to resolve the ambiguity
    override fun f(): Int {
        // Choose an arbitrary implementation, e.g., return 7
        return 7;
    }
    
    receive() {
        // Compute g(), which should equal f() + 1, i.e., 7 + 1 = 8
        let x: Int = self.g();
        dump(x);
    }
}
