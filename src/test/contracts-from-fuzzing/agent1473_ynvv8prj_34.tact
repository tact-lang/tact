struct Bits {
    u1: Int as uint1;
    u4: Int as uint4;
    u8: Int as uint8;
    u16: Int as uint16;
    i4: Int as int4;
    i8: Int as int8;
    i16: Int as int16;
}

contract TestContract {
    bits: Bits;

    init() {
        self.bits = Bits{ u1:1,u4:2,u8:3,u16:4,i4:-1,i8:-2,i16:-3 };
    }
}