struct S {
    a: Int as uint16;
    b: Int as uint32;
    c: Int as int64;
    d: Int as coins;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            a: 10,
            b: 1000,
            c: 100000,
            d: ton("1")
        };
    }
}