contract OptionalCombined {
    a: Int? as uint8;
    b: Bool?;
    c: String?;
    d: Int? as int16;
    e: String?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}
