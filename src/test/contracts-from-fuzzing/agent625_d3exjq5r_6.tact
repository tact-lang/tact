struct Packed {
    a: Int as int8;
    b: Int as uint7;
    c: Int as int64;
    d: Int as uint4;
}

contract Test {
    data: Packed;

    init() {
        self.data = Packed { a: -1, b: 3, c: 9999, d: 4 };
    }
}