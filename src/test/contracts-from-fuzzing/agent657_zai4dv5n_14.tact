struct Packed {
    a: Int as uint8;
    b: Int as uint4;
    c: Int as int16;
    d: Bool;
    e: Bool;
}

contract TestPacked {
    p: Packed;

    init() {
        self.p = Packed{
            a: 255,
            b: 7,
            c: -32768,
            d: true,
            e: false
        };
    }
}