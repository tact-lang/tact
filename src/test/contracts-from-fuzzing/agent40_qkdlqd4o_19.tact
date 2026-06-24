struct IntLimitsTest {
    u4: Int as uint4;
    i4: Int as int4;
    u8: Int as uint8;
    i8: Int as int8;
    default: Int;
}

contract StorageIntLimits {
    vals: IntLimitsTest;

    init() {
        self.vals = IntLimitsTest{
            u4:5, i4:-3, u8:255, i8:-128, default:1000
        };
    }
}