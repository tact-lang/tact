contract BoolAndIntLayout {
    a: Bool;
    b: Int;
    c: Bool?;
    d: Int?;

    init() {
        self.a = true;
        self.b = 42;
        self.c = null;
        self.d = null;
    }
}