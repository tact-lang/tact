struct Tiny {
    f1: Int as uint1;
    f2: Int as uint2;
    f3: Int as uint3;
    f4: Int as uint4;
}

contract SmallBits {
    bits: Tiny;
    init() {
        self.bits = Tiny{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4
        };
    }
}