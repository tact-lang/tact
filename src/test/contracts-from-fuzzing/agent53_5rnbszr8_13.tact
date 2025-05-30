contract UnusedGetter {
    x: Int = 10;
    
    // Getter declared but never used
    get fun unused(): Int {
        return self.x;
    }

    receive() {}
}
