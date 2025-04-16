struct Complex {
    a: Int as uint8;
    b: Int as int64;
    c: Int as coins;
    d: Bool;
    e: Bool?;
}

contract SerializeComplex {
    s: Complex;
    init() {
        self.s = Complex{
            a: 1,
            b: -42,
            c: ton("1"),
            d: true,
            e: null
        };
    }
    receive() {
        let _ = self.s.a + self.s.b + self.s.c;
    }
}