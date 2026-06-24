struct Numbers {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as uint64;
}

contract NumbersContract {
    n: Numbers;

    init() {
        self.n = Numbers{a:1, b:2, c:3, d:4, e:5};
    }
}