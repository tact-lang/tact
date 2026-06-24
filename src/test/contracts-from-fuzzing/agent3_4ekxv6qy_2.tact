struct XY {
    a: Int;
    b: Int;
}

trait T1 {
    // Abstract constant, must be overridden
    abstract const X: Int;
    
    // Virtual constant, with a default value
    virtual const Y: Int = 50;

    // Helper function returning a struct containing the constants
    fun getXY(): XY {
        return XY{ a: self.X, b: self.Y };
    }
}

contract Test1() with T1 {
    // Override both abstract and virtual constants
    override const X: Int = 10;
    override const Y: Int = 20;

    // Receiver function to ensure trait functions are invoked
    receive() {
        let xy: XY = self.getXY();
        // Use variables to avoid unused warnings
        let _ = xy.a + xy.b;
        cashback(sender());
    }
}
