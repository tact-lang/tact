struct MixedSer {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int1;
    d: Int as uint4;
    e: Int;
}

contract SerMixed {
    s: MixedSer;

    init() {
        self.s = MixedSer{ a:50, b:4294967295, c:0, d:15, e:123456789 };
    }

    receive() {
        self.s = self.s;
    }
}