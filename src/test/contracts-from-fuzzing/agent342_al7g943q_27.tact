struct SerialFormats {
    a: Int as int64;
    b: Int as uint64;
    c: Int as uint8;
    d: Int as int16;
    e: Int;
}

contract SerializeFormats {
    fld: SerialFormats;

    init() {
        self.fld = SerialFormats{
            a: -10,
            b: 20,
            c: 255,
            d: -128,
            e: 1000000
        };
    }
}
