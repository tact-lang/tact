struct TinyBits {
    a: Int as int1;
    b: Int as uint1;
    c: Bool;
    d: Bool;
}

contract BitPacking {
    vals: TinyBits = TinyBits {
        a: -1,
        b: 1,
        c: true,
        d: false
    };

    init() {
        self.vals = TinyBits {
            a: 0,
            b: 0,
            c: false,
            d: true
        };
    }

    receive() {}
}