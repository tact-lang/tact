struct Pack {
    a: Int as int64;
    b: Int as uint4;
    c: Bool;
    d: Bool;
}

contract Test {
    foo: Pack;

    init() {
        self.foo = Pack{ a: 123, b: 9, c: true, d: false };
    }
}