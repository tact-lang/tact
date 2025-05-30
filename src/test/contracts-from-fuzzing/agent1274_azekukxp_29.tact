struct Ints {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract MultiInts {
    st: Ints;

    init() {
        self.st = Ints {
            a: 1,
            b: 2,
            c: 3,
            d: 4
        };
    }
}