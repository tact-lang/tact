struct Int256s {
    a: Int as int256;
    b: Int as int256;
    c: Int as int256;
}

contract BigInts {
    vals: Int256s;

    init() {
        self.vals = Int256s{
            a: 1,
            b: -1,
            c: 0,
        };
    }
}