contract TestUnusedGetter {
    x: Int = 7;
    
    receive() {}
    
    // This getter is declared but never used
    get fun unusedGetter(): Int {
        return self.x;
    }
}
