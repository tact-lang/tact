// Test contract persistent Int fields with explicit serialization annotations
contract IntSerialization {
    ui8: Int as uint8; // 0..255
    i16: Int as int16; // -32768..32767
    i64: Int as int64;
    ui128: Int as uint128;

    init() {
        self.ui8 = 200;
        self.i16 = -12345;
        self.i64 = 1234567890;
        self.ui128 = 340282366920938463463374607431768211455; // max uint128
    }
}
