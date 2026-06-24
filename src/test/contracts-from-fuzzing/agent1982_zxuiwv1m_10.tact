struct IntSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int257;
}

contract VarIntSizes {
    vals: IntSizes;

    init() {
        self.vals = IntSizes { a:1, b:2, c:3, d:4, e:5 };
    }
}