trait TraitA {
    // Abstract function declaration in TraitA
    abstract fun foo(): Int;
}

trait TraitB {
    // Abstract function declaration in TraitB with the same signature
    abstract fun foo(): Int;
}

contract TestDualFoo() with TraitA, TraitB {
    // A single override implementation should satisfy both traits
    override fun foo(): Int {
        return 999;
    }

    receive() {
        let result = self.foo(); // should be 999
        dump(result);
        cashback(sender());
    }
}
