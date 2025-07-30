contract NestedDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = false;
        self.d = true;
    }
}
