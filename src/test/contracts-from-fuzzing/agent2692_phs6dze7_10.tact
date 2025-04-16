struct MixWidths {
    a: Int as int64;
    b: Int as int16;
    c: Int as uint8;
    d: Int;
    e: Int?;
    f: Int as uint4;
}

contract UseMixWidths {
    field: MixWidths;

    init() {
        self.field = MixWidths{
            a: 1000,
            b: 100,
            c: 10,
            d: 5,
            e: null,
            f: 3
        };
    }
}
