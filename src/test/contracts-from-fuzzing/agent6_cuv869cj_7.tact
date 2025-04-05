trait TraitA {
    // A virtual constant with a default value
    virtual const val: Int = 1;
}

trait TraitB with TraitA {
    // Override the constant from TraitA
    override const val: Int = 2;
}

contract TestTraitOrder() with TraitB, TraitA {
    receive() {
        // In a correct resolution, self.val should be 2
        let result = self.val;
        // For fuzz-testing purposes, we simply compute the value.
    }
}
