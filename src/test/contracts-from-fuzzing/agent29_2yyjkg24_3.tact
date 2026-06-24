trait TraitA {
    fun foo(): Int { return 1; }
}

trait TraitB {
    fun foo(): Int { return 2; }
}

contract TestContract() with TraitA, TraitB {
    override fun foo(): Int {
        // Explicitly resolve conflict by overriding foo()
        return 42;
    }

    receive() {
        let x = self.foo();
        dump(x);
        cashback(sender());
    }
}
