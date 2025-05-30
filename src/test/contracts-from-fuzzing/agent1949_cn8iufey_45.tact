contract BoolIntOptionalMix {
    a: Bool;
    b: Int?;
    c: Bool?;
    d: Int;

    init() {
        self.a = true;
        self.b = null;
        self.c = null;
        self.d = 0;
    }
}
