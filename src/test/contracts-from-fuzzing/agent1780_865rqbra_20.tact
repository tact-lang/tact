contract OptionalSerialization {
    a: Int? as uint8;
    b: Int? as int16;
    c: Bool?;
    d: Bool;
    e: Int as uint4;

    init() {
        self.a = 5;
        self.b = -17;
        self.c = null;
        self.d = true;
        self.e = 12;
    }
}