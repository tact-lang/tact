trait SimpleTrait {
    // Abstract function: must be implemented by inheriting contract
    abstract fun getVal(): Int;

    // Virtual constant with a default value
    virtual const DEFAULT: Int = 1;
}

contract SimpleContract() with SimpleTrait {
    // Override abstract function to return the virtual constant plus an offset
    override fun getVal(): Int {
       return self.DEFAULT + 3;
    }
    
    // Override the virtual constant
    override const DEFAULT: Int = 5;
    
    receive() {
        let x = self.getVal();
        // For testing, we simply forward the remaining value; x is computed but not used off-chain
        cashback(sender());
    }
}
