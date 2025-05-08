contract OptionalMix {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
    e: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 3;
        self.d = null;
        self.e = 5;
    }
}