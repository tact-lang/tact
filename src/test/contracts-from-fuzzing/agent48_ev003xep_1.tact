contract TestPrimitiveGetter {
    v: Int = 123;
    
    // Minimal receiver to force compilation of functions
    receive() {}
    
    // Simple getter that returns a primitive Int
    get fun getInt(): Int {
        return self.v;
    }
}
