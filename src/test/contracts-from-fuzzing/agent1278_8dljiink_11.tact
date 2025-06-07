struct Compact {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
    d: Int as uint4;
    e: Int as uint5;
    f: Int as uint6;
}

contract TestContract {
    comp: Compact;

    init() {
        self.comp = Compact{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: 6,
        };
    }
}