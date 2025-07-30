trait TraitA {
    fun foo(): Int { return 1; }
}

trait TraitB {
    fun foo(): Int { return 2; }
}

contract Test() with TraitA, TraitB {
    // To resolve the conflict, we override foo
    override fun foo(): Int { return 3; }

    receive() {
        dump(self.foo());
    }
}
