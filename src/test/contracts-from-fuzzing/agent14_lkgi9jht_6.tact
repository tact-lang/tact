struct OddInts {
    a: Int as int1;
    b: Int as int64;
    c: Int as uint8;
    d: Int as int257;
}

contract TestContract {
    odd: OddInts;

    init() {
        self.odd = OddInts{ a: 1, b: 2, c: 3, d: 4 };
    }
}