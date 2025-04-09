// Persistent variable with explicit type serialization
contract SerializedInts {
    u8: Int as uint8;
    i64: Int as int64;
    u167: Int as uint167;

    init() {
        self.u8 = 123;
        self.i64 = -50000;
        self.u167 = 123456789012345678901234567890;
    }
}