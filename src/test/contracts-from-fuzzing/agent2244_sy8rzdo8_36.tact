contract ScalarMix {
    foo: Int as uint32;
    bar: Int as int64;
    baz: Int;
    b1: Bool;
    b2: Bool;
    s: String;

    init() {
        self.foo = 42;
        self.bar = -1234;
        self.baz = 5678;
        self.b1 = true;
        self.b2 = false;
        self.s = "string";
    }
}