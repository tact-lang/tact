contract ComplexOrdering {
    a: Int as uint32;
    b: Bool;
    c: Int as int8;
    d: String;
    e: Bool;

    init() {
        self.a = 1234;
        self.b = true;
        self.c = -5;
        self.d = "hello";
        self.e = false;
    }
}