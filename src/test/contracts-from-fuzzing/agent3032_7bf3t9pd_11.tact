struct Seri {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint32;
    d: Int as int257;
}

contract SerSample {
    s: Seri;

    init() {
        self.s = Seri{ a: 5, b: 6, c: 7, d: 8 };
    }
}