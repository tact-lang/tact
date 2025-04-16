contract Test18 {
    a: Int;
    b: Int;

    init() {
        self.a = 1;
        self.b = 2;
    }

    get fun getVals(): Int {
        return self.a + self.b;
    }
}