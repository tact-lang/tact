contract OptionalMix {
    a: Int?;
    b: Int as int64;
    c: Bool?;
    d: Bool;

    init() {
        self.a = null;
        self.b = 5555;
        self.c = false;
        self.d = true;
    }
}