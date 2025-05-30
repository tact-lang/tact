contract TestGetter {
    var: Int;
    
    init() {
        self.var = 0;
    }

    // Getter function attempts to modify state variable
    get fun getter1(): Int {
        self.var += 1;
        return self.var;
    }
}
