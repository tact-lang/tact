contract TestFields {
    a: Int;
    b: String = "hello";
    c: Bool;

    init() {
        self.a = 123;
        self.b = "world";
        self.c = true;
    }
}
