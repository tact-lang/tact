contract OptionalMix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = false;
        self.d = true;
    }
}