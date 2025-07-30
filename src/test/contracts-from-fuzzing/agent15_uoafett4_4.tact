trait T {
    // Abstract constant: must override
    abstract const C1: Int;
    
    // Virtual constant with default
    virtual const C2: Int = 123;
}

contract X() with T {
    // Override abstract constant C1
    override const C1: Int = 10;
    
    // Not overriding C2, so it should be inherited as 123
    
    receive() {
        // Expected: 10 + 123 = 133
        dump(self.C1 + self.C2);
    }
}
