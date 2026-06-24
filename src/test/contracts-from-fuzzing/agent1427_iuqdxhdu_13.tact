struct IntSizes {
    tiny: Int as uint4;
    small: Int as int16;
    medium: Int as uint64;
    big: Int; // default 257 bits
}

contract IntSizesTest {
    s: IntSizes;
    init() {
        self.s = IntSizes{
            tiny: 7,
            small: 100,
            medium: 1000,
            big: 10000
        };
    }
}