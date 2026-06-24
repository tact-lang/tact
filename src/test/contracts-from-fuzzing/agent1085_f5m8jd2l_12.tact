struct SizeTest {
    f1: Int;
    f2: Int as uint64;
    f3: Int as uint255;
    f4: Int as int8;
    f5: Int as uint1;
}

contract SerializationSizeVariants {
    s: SizeTest;
    
    init() {
        self.s = SizeTest{
            f1: -1,
            f2: 1234567890,
            f3: 123456789012345,
            f4: -12,
            f5: 1
        };
    }
}