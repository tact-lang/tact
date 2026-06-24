contract TestArithmetic {
    // Evaluate constant expression at compile time
    const VAL: Int = 10 * 2 + 5;  // Expected to be 25
    a: Int = self.VAL;
    
    receive() {}
}
