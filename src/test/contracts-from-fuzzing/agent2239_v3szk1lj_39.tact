contract OnlyInts {
    a: Int;
    b: Int?;
    c: Int as uint8;
    d: Int? as uint4;

    init() {
        self.a = 5;
        self.b = null;
        self.c = 255;
        self.d = null;
    }
}