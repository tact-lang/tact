struct S {
    a: Int as uint4;
    b: Int as int32;
    c: Int;
}

contract StructSerialFormat {
    s: S;

    init() {
        self.s = S { a: 2, b: -5, c: 100 };
    }

    receive() {}
}