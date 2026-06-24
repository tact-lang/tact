struct S {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int16;
    d: Int as uint4;
}

contract Test {
    data: S;

    init() {
        self.data = S{
            a: 5,
            b: 10,
            c: 2,
            d: 3
        };
    }
}