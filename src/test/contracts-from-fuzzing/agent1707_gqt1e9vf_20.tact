struct LowBitwidths {
    i4: Int as uint4;
    i8: Int as int8;
    i16: Int as uint16;
    i32: Int as int32;
}

contract LowBitContract {
    data: LowBitwidths;

    init() {
        self.data = LowBitwidths{
            i4: 3,
            i8: -7,
            i16: 65535,
            i32: -123456
        };
    }
}