struct IntWidths {
    u4: Int as uint4;
    u8: Int as uint8;
    i64: Int as int64;
    i257: Int as int257;
}

contract WidthMix {
    data: IntWidths;

    init() {
        self.data = IntWidths{
            u4: 7,
            u8: 255,
            i64: -5000000,
            i257: 123456789012345678901234567890
        };
    }
}