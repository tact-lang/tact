trait TraitA {
    fun foo(): Int { return 10; }
}

trait TraitB {
    abstract fun foo(): Int;
}

contract Test() with TraitA, TraitB {
    override fun foo(): Int {
        return 20;
    }

    receive() {
        let x = self.foo();
        dump(x);
    }
}
