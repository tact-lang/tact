contract NoDefaultsAllInit {
    a: Int;
    b: Bool;
    c: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "str";
    }
}
