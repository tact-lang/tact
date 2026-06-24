trait TraitA {
    abstract fun f(): Int;
}

contract CorrectContract() with TraitA {
    override fun f(): Int {
        return 1;
    }

    receive() {
        // Correctly access trait function via self
        let x = self.f();
        // use x in some way
        let _ = x;
    }
}
