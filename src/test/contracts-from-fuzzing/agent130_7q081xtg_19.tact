// Mix different serialization formats for ints in struct fields
struct MixedInts {
    big: Int = 0;
    u8: Int as uint8;
    i16: Int as int16;
    u4: Int as uint4;
    i1: Int as int1;
    standard: Int;
}

contract TestContract {
    m: MixedInts;

    init() {
        self.m = MixedInts{
            big: 123456789012345,
            u8: 255,
            i16: -12345,
            u4: 15,
            i1: -1,
            standard: -42
        };
    }

    receive() {
        self.m = self.m;
    }
}