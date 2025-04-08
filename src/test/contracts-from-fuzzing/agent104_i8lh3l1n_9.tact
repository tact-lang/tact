struct Packed {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int64;
    d: Bool;
    e: Bool;
}

contract PackedContract {
    p: Packed;

    init() {
        self.p = Packed{
            a: 5,
            b: 10,
            c: 100,
            d: true,
            e: false,
        };
    }
}
