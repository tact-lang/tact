// Combining many primitives with different serialization
contract SerializeMix {
    u8: Int as uint8;
    i8: Int as int8;
    u16: Int as uint16;
    i32: Int as int32;
    u64: Int as uint64;
    regular: Int;

    init() {
        self.u8=1; self.i8=2; self.u16=3; self.i32=4; self.u64=5; self.regular=6;
    }
}