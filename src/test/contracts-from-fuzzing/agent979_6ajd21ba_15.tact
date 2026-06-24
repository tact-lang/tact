struct S {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as coins;
}

contract SerFormats {
    f: S;

    init() {
        self.f = S{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
        };
    }
}