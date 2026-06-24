struct Packed {
    a: Int as uint1;
    b: Bool;
    c: Int as uint4;
    d: Bool;
    e: Int as uint8;
    f: Bool;
}

contract TightPacking {
    pack: Packed;

    init() {
        self.pack = Packed{
            a: 1,
            b: true,
            c: 7,
            d: false,
            e: 255,
            f: true,
        };
    }
}
