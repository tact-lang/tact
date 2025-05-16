struct SerializedMix {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
    d: Bool;
    e: Bool?;
    f: String;
    g: String?;
}

contract TestContract {
    sm: SerializedMix;

    init() {
        self.sm = SerializedMix{
            a: 12,
            b: 123456,
            c: -50000,
            d: true,
            e: null,
            f: "data",
            g: null
        };
    }
}