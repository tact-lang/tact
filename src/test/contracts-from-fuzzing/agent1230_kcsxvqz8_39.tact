contract NoDefaultsNoInit {
    a: Int;
    b: Bool;

    init() {
        self.a = 10;
        self.b = true;
    }
}