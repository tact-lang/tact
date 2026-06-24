// Test snippet for explicit override to resolve ambiguous trait methods

trait TraitA {
    fun greet(): Int {
        return 1;
    }
}

trait TraitB {
    fun greet(): Int {
        return 2;
    }
}

contract OverridingContract() with TraitA, TraitB {
    // Explicitly override greet to resolve conflict
    override fun greet(): Int {
        return 100;
    }

    receive() {
        dump(self.greet());
    }
}
