struct Complex {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint4;
    d: Int;
}

contract Test {
    data: Complex;
    init() {
        self.data = Complex{ a: 1, b: -2, c: 3, d: 4 };
    }
}