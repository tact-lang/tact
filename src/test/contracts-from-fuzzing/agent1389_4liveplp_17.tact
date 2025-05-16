contract OptionalSerializing {
    i1: Int? as uint32;
    i2: Int? as int64;
    b1: Bool?;
    a1: Address?;
    s1: String?;

    init() {
        self.i1 = null;
        self.i2 = null;
        self.b1 = null;
        self.a1 = null;
        self.s1 = null;
    }
}