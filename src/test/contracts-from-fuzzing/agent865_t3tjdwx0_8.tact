struct Packed {
    a: Int as uint8;    // 8 bits
    b: Int as uint16;   // 16 bits
    c: Int as int64;    // 64 bits
    d: Bool;            // 1 bit
}

contract TightPacking {
    data: Packed;

    init() {
        self.data = Packed{
            a: 255,
            b: 65535,
            c: -1234567890,
            d: true,
        };
    }
}
