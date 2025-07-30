struct Packed {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int8;
    d: Int as int16;
}

contract PackedFields {
    data: Packed;

    init() {
        self.data = Packed{ a: 1, b: 2, c: 3, d: 4 };
    }
}