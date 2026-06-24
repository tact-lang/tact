struct IntSizes {
    a: Int as int257;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint64;
    e: Int as int1;
}

contract VarSizes {
    s: IntSizes;
    init() {
        self.s = IntSizes{
            a:123,
            b:7,
            c:-5,
            d:100000000,
            e:1
        };
    }
}