trait TraitA {
    abstract fun foo(): Int;
}

contract TestContract() with TraitA {
    override fun foo(): Int {
        return 42;
    }
    
    receive() {
        // Calling foo via self
        dump(self.foo());
    }
}
