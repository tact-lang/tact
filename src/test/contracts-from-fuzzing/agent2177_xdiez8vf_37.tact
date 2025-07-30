struct TinyBits {
    x: Int as uint2;
    y: Int as int3;
    z: Int as uint1;
}

contract MinBitWidths {
    s: TinyBits;

    init() {
        self.s = TinyBits{
            x: 3,
            y: -2,
            z: 1
        };
    }
}