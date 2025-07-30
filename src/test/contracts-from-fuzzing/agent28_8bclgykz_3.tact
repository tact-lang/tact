contract Test {
    var: Int;
    init() {
        self.var = 0;
    }
    
    // Getter function that modifies state
    get fun modify(): Int {
        self.var += 1;
        return self.var;
    }
}
