// Attempt to serialize Int boundaries in smaller than Int types
contract IntBoundarySerialization {
    u8: Int as uint8;
    i8: Int as int8;
    u16: Int as uint16;

    init() {
        self.u8 = 255;
        self.i8 = -128;
        self.u16 = 65535;
    }
}