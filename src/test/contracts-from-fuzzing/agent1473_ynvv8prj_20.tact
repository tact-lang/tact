struct Packed {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32: Int as int32;
    u32: Int as uint32;
}

contract TestContract {
    p: Packed;

    init() {
        self.p = Packed{
            i8:1,u8:2,i16:3,u16:4,i32:5,u32:6
        };
    }
}