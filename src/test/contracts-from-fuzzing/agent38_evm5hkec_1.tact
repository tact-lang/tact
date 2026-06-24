contract TestGetter {
    var: Int;

    init() {
        self.var = 1;
    }

    get fun foo(): Int {
        // Trying to modify state variable in getter
        self.var = 2;
        return self.var;
    }
}
