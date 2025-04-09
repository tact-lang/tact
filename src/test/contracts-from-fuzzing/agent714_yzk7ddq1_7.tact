contract OnlyPrimitives {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = 42;
    }
}