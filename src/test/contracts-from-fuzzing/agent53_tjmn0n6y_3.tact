trait TraitA {
    // Abstract method, must be overridden
    abstract fun foo(): Int;
    
    // Virtual method that can be overridden, default returns 1
    virtual fun bar(): Int {
        return 1;
    }
}

contract TestContract() with TraitA {
    // Override abstract method
    override fun foo(): Int {
        return 42;
    }
    
    // Override virtual method
    override fun bar(): Int {
        return self.foo() + 10;
    }
    
    // A receiver to invoke the methods and send a message with the output
    receive() {
        let res = self.bar();
        // Convert the integer result 'res' to a Cell using a Builder
        let b: Builder = beginCell().storeInt(res, 257);
        let resCell: Cell = b.endCell();
        
        // Construct a simple message output using the result
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            bounce: false,
            body: resCell
        });
    }
}
