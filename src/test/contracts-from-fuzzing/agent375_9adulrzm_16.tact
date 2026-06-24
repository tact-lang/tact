struct IntSizes {
    di: Int;
    i64: Int as int64;
    u32: Int as uint32;
    i8: Int as int8;
    u4: Int as uint4;
}

contract TestContract {
    data: IntSizes;

    init() {
        self.data = IntSizes{
            di: 999999999999,
            i64: -12345678,
            u32: 4000000000,
            i8: -128,
            u4: 15
        };
    }
}
