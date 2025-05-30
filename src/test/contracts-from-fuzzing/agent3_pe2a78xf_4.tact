trait TraitA {
    fun foo(): Int { return 1; }
}

trait TraitB {
    fun foo(): Int { return 2; }
}

contract TestContract() with TraitA, TraitB {
    // Overriding foo to resolve conflict
    override fun foo(): Int {
        return 0;
    }

    receive() {
         dump(self.foo());
    }
}
