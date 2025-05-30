trait TraitA {
    fun foo(): Int { return 1; }
}

trait TraitB {
    abstract fun foo(): Int;
}

contract TestContract() with TraitA, TraitB {
    override fun foo(): Int {
        return 42;
    }

    receive() {
         dump(self.foo());
    }
}
