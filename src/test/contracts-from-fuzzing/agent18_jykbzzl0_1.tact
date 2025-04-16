contract Test {
    v: Int = 42;
    
    // The contract’s receive function is required for complete compilation
    receive() {}
    
    // A getter function returning a primitive value
    get fun getInt(): Int {
        return self.v;
    }
}
