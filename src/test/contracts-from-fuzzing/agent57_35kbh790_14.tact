contract TestUnusedGetter {
    x: Int;
    
    init() {
        self.x = 5;
    }
    
    receive() {}
    
    // Getter that is declared but never used in the contract
    get fun unusedGetter(): Int {
        return self.x;
    }
}
