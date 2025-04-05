/// This snippet tests abstract and concrete function behavior in traits, following the documentation.

// Define a trait with an abstract function and a concrete function based on it.
trait TraitC {
    // Abstract function: must be implemented by any contract using TraitC
    abstract fun inc(x: Int): Int;
    
    // Concrete function that calls the abstract function using 'self'
    fun incThenAdd(x: Int): Int {
        return self.inc(x) + 5;
    }
}

// Contract that inherits TraitC and implements the abstract function
contract IncContract() with TraitC {
    // Override the abstract function: for example, return x + 2
    override fun inc(x: Int): Int {
        return x + 2;
    }
    
    receive() {
        // Test the concrete function: for x = 10, expected result is (10 + 2) + 5 = 17
        let result = self.incThenAdd(10);
        
        // Compose a cell storing the result (using 16 bits, sufficient for number 17)
        let bodyCell = beginCell()
                           .storeInt(result, 16)
                           .endCell();
        
        message(MessageParameters{
            to: sender(),
            value: ton("0.01"),
            mode: SendRemainingValue,
            body: bodyCell
        });
    }
}
