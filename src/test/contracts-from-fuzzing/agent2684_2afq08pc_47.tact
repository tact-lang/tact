struct BigInts {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int128;
    d: Int as uint128;
    e: Int;
}

contract IntStructs {
    ints: BigInts = BigInts {
        a: 1, b: 2, c: 3, d: 4, e: 5
    };

    init() {
        self.ints = BigInts {
            a: 10, b: 20, c: 30, d: 40, e: 50
        };
    }
}
