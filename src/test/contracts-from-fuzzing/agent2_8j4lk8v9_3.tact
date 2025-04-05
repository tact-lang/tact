trait TraitA {
    fun foo(): Int { return 1; }
}

trait TraitB {
    fun foo(): Int { return 2; }
}

contract TestContract() with TraitA, TraitB {
    // Explicitly override foo to resolve conflict
    override fun foo(): Int { 
        // For test purposes, simply return the sum of expected values from TraitA and TraitB
        return 1 + 2;
    }

    receive() {
        let x = self.foo();
        // Dump the result to verify behavior
        dump(x);
    }
}
