struct SizeTest {
    s8: Int as int8;
    u32: Int as uint32;
    s64: Int as int64;
}

contract MixedIntegerSizes {
    data: SizeTest;

    init() {
        self.data = SizeTest{
            s8: -128,
            u32: 123456789,
            s64: -9876543210,
        };
    }
}