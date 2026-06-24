struct Packed {
    a: Int as uint8;
    b: Bool;
    c: Int as uint16;
    d: Bool;
    e: Int as uint4;
}

contract CompactStorage {
    data: Packed;

    init() {
        self.data = Packed{
            a: 1,
            b: true,
            c: 1000,
            d: false,
            e: 8
        };
    }
}
