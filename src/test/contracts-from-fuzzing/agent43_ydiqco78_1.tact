contract Test {
    v: Int = 123;
    
    // Basic getter function returning an Int
    get fun getV(): Int {
        return self.v;
    }
    
    receive() {}
}
