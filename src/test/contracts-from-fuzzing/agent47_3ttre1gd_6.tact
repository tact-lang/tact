trait TraitA {
    abstract fun foo(): Int;
}

trait TraitB {
    fun foo(): Int { return 2; }
}

contract TestContract() with TraitA, TraitB {
    override fun foo(): Int { return 5; }
    
    receive() {
        // minimal receiver
    }
}
