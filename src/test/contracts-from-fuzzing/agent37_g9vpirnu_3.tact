trait TraitA {
    fun foo(): Int {
        return 1;
    }
}

trait TraitB {
    fun foo(): Int {
        return 2;
    }
}

contract TestContract() with TraitA, TraitB {
    // The contract must resolve ambiguities. We override foo().
    override fun foo(): Int {
        return 3;
    }

    receive() {
        // Calling self.foo() because foo() is a member of self
        dump(self.foo());
    }
}
