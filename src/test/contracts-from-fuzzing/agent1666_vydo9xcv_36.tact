contract SignedUnsigned {
    a: Int as uint8;
    b: Int as int8;
    init() {
        self.a = 255;
        self.b = -128;
    }
}