contract Test {
    v: Int = 42;
    
    receive() {}
    
    // Getter returning an Int using self.
    get fun getInt(): Int {
        return self.v;
    }
}