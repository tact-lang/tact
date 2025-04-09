contract UnusedGetter {
    x: Int = 5;
    
    receive() {}
    
    // Getter that is declared but never used anywhere
    get fun unused(): Int {
        return self.x;
    }
}
