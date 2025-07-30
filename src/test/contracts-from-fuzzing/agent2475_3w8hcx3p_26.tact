struct X {
    a: Int;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as uint32;
    f: Int as int64;
}

contract MixedSizedInts {
    s: X;
    init() {
        self.s = X{ a:1,b:2,c:3,d:4,e:5,f:6 };
    }
}