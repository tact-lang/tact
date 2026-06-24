struct Tiny {
    a: Int as uint1;
    b: Int as uint1;
    c: Int as uint1;
    d: Int as uint1;
    e: Int as uint1;
}

contract TinyBits {
    st: Tiny;

    init() {
        self.st = Tiny{
            a: 1,
            b: 0,
            c: 1,
            d: 0,
            e: 1,
        };
    }
}
