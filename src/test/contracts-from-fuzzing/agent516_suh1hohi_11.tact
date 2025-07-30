struct Packed {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Bool;
    e: Int?;
}

contract PackedTest {
    data: Packed;

    init() {
        self.data = Packed{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: null
        };
    }
}
