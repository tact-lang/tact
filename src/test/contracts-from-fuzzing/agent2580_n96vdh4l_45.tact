contract OptionalSerialization {
    a: Int? as int64;
    b: Int? as uint4;
    c: Int?;

    init() {
        self.a = null;
        self.b = 7;
        self.c = null;
    }
}