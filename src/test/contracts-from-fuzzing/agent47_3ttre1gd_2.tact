trait TraitA {
    fun foo(): Int { return 1; }
}

trait TraitB {
    fun foo(): Int { return 2; }
}

contract TestContract() with TraitA, TraitB {
    override fun foo(): Int {
        return 3;
    }

    receive() {
        // minimal receiver
    }
}
