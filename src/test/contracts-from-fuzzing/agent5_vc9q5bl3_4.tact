trait T1 {
    // Abstract constant must be overridden in any inheriting contract
    abstract const A: Int;
    
    // A simple function to return the constant
    fun getA(): Int {
        return self.A;
    }
}

trait T2 {
    // Virtual constant can have a default value and be optionally overridden
    virtual const B: Int = 100;
    
    // A function to return the constant
    fun getB(): Int {
        return self.B;
    }
}

contract D() with T1, T2 {
    // Override abstract constant A and virtual constant B
    override const A: Int = 50;
    override const B: Int = 200;
    
    // A test function to use values from traits
    fun testConstants(): Int {
        return self.getA() + self.getB(); // should evaluate to 50 + 200 = 250
    }
    
    receive() {
        // Calling testConstants() during receive
        self.testConstants();
    }
}
