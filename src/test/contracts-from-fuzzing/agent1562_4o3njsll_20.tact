struct Packed {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int257;
    d: Bool;
    e: String;
}

contract PackedFields {
    pf: Packed;

    init() {
        self.pf = Packed{
            a: 5,
            b: 300,
            c: -1000,
            d: true,
            e: "packed"
        };
    }
}
