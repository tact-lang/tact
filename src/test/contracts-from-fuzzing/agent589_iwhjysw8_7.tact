struct MixSerialize {
    a: Int as uint8;
    b: Int as int64;
    c: Int; // default int257
    d: Int as uint4;
    e: Bool;
    f: String;
    g: String?;
    h: Int?;
}

contract SerializeFields {
    field: MixSerialize;

    init() {
        self.field = MixSerialize{
            a: 12,
            b: 123456789,
            c: -555,
            d: 7,
            e: false,
            f: "text",
            g: null,
            h: null,
        };
    }
}