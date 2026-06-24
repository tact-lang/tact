contract GetterModify {
    var: Int;

    init() {
        self.var = 10;
    }

    // Getter attempting to modify state (should be disallowed)
    get fun getAndModify(): Int {
        self.var = 5; // This is not allowed in getter functions
        return self.var;
    }
}
