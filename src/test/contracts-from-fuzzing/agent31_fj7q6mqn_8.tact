trait TraitAbs {
    // Abstract function that must be overridden
    abstract fun trust(): Int;
    
    // A helper function that calls the abstract method via self
    fun callTrust(): Int {
        return self.trust();
    }
}

contract TestContractAbs() with TraitAbs {
    // Provide override for the abstract function
    override fun trust(): Int {
        return 42;
    }
    
    receive() {
        let res = self.callTrust();
        require(res == 42, "42 expected");
        cashback(sender());
    }
}
