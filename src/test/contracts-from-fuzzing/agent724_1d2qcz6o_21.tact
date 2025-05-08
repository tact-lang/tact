struct Inner {
    f1: Int as uint8;
    f2: Int as uint16;
}

struct Mixed {
    a: Int as uint32;
    b: Bool;
    c: Inner;
    d: Int as int256;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed{
            a: 1,
            b: true,
            c: Inner{f1:3,f2:4},
            d: 5
        };
    }
}