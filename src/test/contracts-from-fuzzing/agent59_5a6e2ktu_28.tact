contract MixPersistent {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    p: Bool?;
    q: String?;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "abc";
        self.o = null;
        self.p = null;
        self.q = null;
    }
}