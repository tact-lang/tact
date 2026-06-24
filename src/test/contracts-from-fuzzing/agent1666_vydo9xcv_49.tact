contract OptionalExplicitBits {
    a: Int? as uint4;
    b: Int? as int64;
    c: Int? as uint32;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}