contract UnusedGetter {
    counter: Int = 999;
    
    receive() {}
    
    // Getter is never referenced internally
    get fun getCounter(): Int {
        return self.counter;
    }
}
