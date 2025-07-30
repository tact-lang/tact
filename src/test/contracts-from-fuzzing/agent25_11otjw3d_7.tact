trait CombinedTrait {
    // A virtual constant with default value
    virtual const OFFSET: Int = 3;
    
    // A virtual function that adds the constant offset to its argument
    virtual fun addOffset(x: Int): Int {
        return x + self.OFFSET;
    }
}

contract CombinedTest() with CombinedTrait {
    // Override the virtual constant
    override const OFFSET: Int = 10;
    
    receive() {
        // Expected: addOffset(20) should yield 20 + 10 = 30
        let result = self.addOffset(20);
        dump(result);
    }
}
