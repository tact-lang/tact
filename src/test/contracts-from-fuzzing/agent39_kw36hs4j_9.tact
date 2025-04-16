trait TraitA {
    // Abstract method: must be implemented
    abstract fun foo(): Int;

    // Concrete method: returns 100
    fun bar(): Int {
        return 100;
    }
}

// TraitB inherits from TraitA and provides an implementation for foo()
trait TraitB with TraitA {
    override fun foo(): Int {
        return 200;
    }
}

// Contract that inherits from TraitB (and transitively from TraitA)
contract Test2 with TraitB {
    // No persistent state variables needed
    receive() {
        let result = self.foo();  // should return 200 as provided by TraitB
        // For minimal test, do a dummy usage of result
        let _ = result + self.bar(); // This should be 200 + 100 = 300
        return;
    }
}
