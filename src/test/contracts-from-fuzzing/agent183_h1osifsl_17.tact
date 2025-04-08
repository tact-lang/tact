contract DeeplyInit {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}