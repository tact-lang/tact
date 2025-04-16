struct SerializeOpts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as int64;
    e: Int;
}

contract VariousSerializationPresets {
    s: SerializeOpts;

    init() {
        self.s = SerializeOpts{
            a: 7,
            b: 255,
            c: -120,
            d: 123456789,
            e: -1,
        };
    }
}