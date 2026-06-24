struct MultiSpec {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    note: String?;
}

contract MultiSpecPersists {
    ms: MultiSpec;

    init() {
        self.ms = MultiSpec{
            a: 250,
            b: -12345,
            c: 429496729,
            d: -9876543210,
            note: "multi",
        };
    }
}