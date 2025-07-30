contract BoolIntCombo {
    a: Bool = true;
    b: Int = -1;
    c: Bool = false;
    d: Int = 0;
    e: Int = 42;

    init() {
        self.a = false;
        self.b = 123;
        self.c = true;
        self.d = 456;
        self.e = 789;
    }
}