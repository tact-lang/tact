contract UnusedGetter {
    v: Int = 100;
    
    // This getter is declared but never used
    get fun unused(): Int {
        return self.v;
    }
    
    receive() {}
}
