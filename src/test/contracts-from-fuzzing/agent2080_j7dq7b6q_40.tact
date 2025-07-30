contract EdgeSignedUnsigned {
    u8: Int as uint8;
    s8: Int as int8;
    init() {
        self.u8 = 255;
        self.s8 = -128;
    }
}