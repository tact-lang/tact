trait TraitA {
    fun f(): Int {
        return 1;
    }
}

trait TraitB {
    fun f(): Int {
        return 2;
    }
}

contract TestContract() with TraitA, TraitB {
    // Override to resolve the conflict between TraitA and TraitB implementations
    override fun f(): Int {
        // For demonstration we return the sum of the two values
        return 1 + 2;
    }

    receive() {
        dump(self.f());
        cashback(sender());
    }
}
