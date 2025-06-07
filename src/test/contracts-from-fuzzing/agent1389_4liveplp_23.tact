contract MultiOptionSerial {
    a: Int? as uint4;
    b: Bool?;
    c: Int? as int64;
    d: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}