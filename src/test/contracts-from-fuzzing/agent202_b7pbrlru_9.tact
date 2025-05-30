contract InitDefaults {
    a: Int = 42;
    b: Int;
    c: Bool;

    init() {
        self.b = 13;
        self.c = true;
    }

    receive() {
        let _ = self.a + self.b;
        let _ = self.c;
    }
}