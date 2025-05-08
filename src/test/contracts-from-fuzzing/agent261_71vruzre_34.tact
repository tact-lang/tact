contract ChainDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: Bool = false;
    s: String = "abc";

    init() {
        self.a = 10;
        self.b = 20;
        self.c = false;
        self.d = true;
        self.s = "xyz";
    }

    receive() {
        let _ = self.a + self.b;
    }
}