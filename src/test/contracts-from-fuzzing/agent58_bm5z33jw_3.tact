trait T2 {
    // Abstract constant
    abstract const X: Int;
    // Virtual constant with default value
    virtual const Y: Int = 10;
    
    // Function that uses these constants
    fun sumConstants(): Int {
        return self.X + self.Y;
    }
}

contract D() with T2 {
    // Override abstract constant
    override const X: Int = 5;
    // Override virtual constant
    override const Y: Int = 20;
    
    receive() {
        let s = self.sumConstants();
        dump(s); // expected: 5 + 20 = 25
    }
}
