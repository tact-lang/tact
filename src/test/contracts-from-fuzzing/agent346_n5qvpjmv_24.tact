struct Tiny {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
    d: Int as uint4;
}

contract SmallInts {
    m: Tiny;
    init() {
        self.m = Tiny{ a:1, b:2, c:3, d:4 };
    }
}