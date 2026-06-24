struct SeriesBits {
    a: Int as uint4; // 0-15
    b: Int as uint8; // 0-255
    c: Int as uint16; // 0-65535
    d: Int as uint32;
}

contract SerializedBits {
    bitsIn: SeriesBits;

    init() {
        self.bitsIn = SeriesBits{
            a: 5,
            b: 20,
            c: 300,
            d: 100000
        };
    }
}