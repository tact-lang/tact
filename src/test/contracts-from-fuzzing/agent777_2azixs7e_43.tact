contract DeepOptMix {
    a: Int?;
    b: Bool?;
    c: Int? as uint32;
    d: Bool?;
    e: Int as int64;

    init() {
        self.a = null;
        self.b = true;
        self.c = 123;
        self.d = null;
        self.e = -456;
    }
}