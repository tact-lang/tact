contract TestGetter1 {
    var: Int;

    init() {
        self.var = 42;
    }

    get fun getVar(): Int {
        return self.var;
    }
}
