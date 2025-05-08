struct S {
    i1: Int;
    i2: Int as int64;
    i3: Int as uint8;
    i4: Int as coins;
    b1: Bool;
    o1: Int?;
    o2: Bool?;
}

contract TestContract {
    f: S;
    init() {
        self.f = S{
            i1: 255,
            i2: -64,
            i3: 42,
            i4: 1000000000,
            b1: true,
            o1: null,
            o2: null
        };
    }
}