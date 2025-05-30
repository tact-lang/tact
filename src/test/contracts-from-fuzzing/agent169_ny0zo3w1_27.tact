contract TestContract {
    s: String;
    b: Bool?;
    i: Int as uint32;

    init() {
        self.s = "str";
        self.b = null;
        self.i = 123;
    }
}