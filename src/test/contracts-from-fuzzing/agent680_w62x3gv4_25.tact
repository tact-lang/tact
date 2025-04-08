contract ExplicitUninitialized {
    a: Int;
    b: Bool;
    s: String;

    init() {
        self.a = 10;
        self.b = true;
        self.s = "hi";
    }

    receive() {
        let _ = self.a + 1;
    }
}