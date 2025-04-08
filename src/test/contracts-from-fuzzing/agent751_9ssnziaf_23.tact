struct S {
    a: Int as coins;
    b: Int as int64;
    c: Int as uint8;
}

contract MixedSerialize {
    s: S;

    init() {
        self.s = S{
            a: 0,
            b: 0,
            c: 0
        };
    }
}