struct Sizer {
    u4: Int as uint4;
    u8: Int as uint8;
    s16: Int as int16;
    s32: Int as int32;
}

contract Bitsizers {
    s: Sizer;

    init() {
        self.s = Sizer{
            u4: 8, u8: 255, s16: -32768, s32: 2147483647
        };
    }
}
