struct IntsWithSizes {
    f8: Int as uint8;
    f16: Int as int16;
    f32: Int as uint32;
    f64: Int as int64;
    f128: Int as uint128;
}

contract TestContract {
    data: IntsWithSizes;

    init() {
        self.data = IntsWithSizes{
            f8: 1,
            f16: -2,
            f32: 3,
            f64: -4,
            f128: 5
        };
    }
}