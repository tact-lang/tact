struct Packed {
    b1: Bool;
    u4: Int as uint4;
    u8: Int as uint8;
    s8: Int as int8;
    big: Int;
}

contract VariousSerializations {
    data: Packed;

    init() {
        self.data = Packed{
            b1: true,
            u4: 5,
            u8: 100,
            s8: -10,
            big: 1000000
        };
    }
}