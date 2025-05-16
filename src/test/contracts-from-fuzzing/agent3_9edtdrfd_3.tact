trait TraitA {
    abstract fun f(): Int;
}

trait TraitB {
    abstract fun f(): Int;
}

contract TestContract() with TraitA, TraitB {
    override fun f(): Int {
        return 1;
    }

    receive() {
        // Use the implemented f to compute a value
        let x = self.f(); // expected to be 1
        cashback(sender());
    }
}
