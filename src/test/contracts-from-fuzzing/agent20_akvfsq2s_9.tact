trait ComputeTrait {
    // Abstract function: must be implemented by the contract
    abstract fun compute(x: Int): Int;
    
    // Virtual constant: default multiplier is 2
    virtual const multiplier: Int = 2;

    // Concrete function that uses the abstract function and the virtual constant
    fun computeFinal(x: Int): Int {
        return self.compute(x) * self.multiplier;
    }
}

contract AdvancedContract() with ComputeTrait {
    // Override the abstract function: compute(x) returns x+3
    override fun compute(x: Int): Int {
        return x + 3;
    }

    // Override the virtual constant 'multiplier' to be 4
    override const multiplier: Int = 4;
    
    receive() {
        // Use a local variable as input
        let initial = 10; // Example input
        // computeFinal(initial) should yield (10 + 3) * 4 = 52
        let result = self.computeFinal(initial);
        
        // Compose a cell that stores the result (using 257 bits)
        let bodyCell = beginCell()
                           .storeInt(result, 257)
                           .endCell();
        
        message(MessageParameters{
            to: sender(),
            value: ton("0.01"),
            mode: SendRemainingValue,
            body: bodyCell
        });
    }
}
