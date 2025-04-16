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
        // Dummy receiver
    }
}
