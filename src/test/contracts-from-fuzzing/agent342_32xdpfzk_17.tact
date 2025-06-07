struct Serialization {
    a: Int as uint4;
    b: Int as int64;
    c: Int as coins;
}

contract Test16 {
    s: Serialization;

    init() {
        self.s = Serialization{
            a: 7,
            b: -500,
            c: 1000000000,
        };
    }
}