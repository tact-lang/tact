struct IntsSmall {
    a: Int as uint4;
    b: Int as uint2;
    c: Int as int8;
    d: Int as int1;
}

contract SmallIntsTest {
    vals: IntsSmall;

    init() {
        self.vals = IntsSmall{
            a: 7,
            b: 2,
            c: -5,
            d: -1
        };
    }
}