contract BoolIntString {
    b: Bool;
    i: Int as uint64;
    s: String;

    init() {
        self.b = true;
        self.i = 123;
        self.s = "test";
    }
}