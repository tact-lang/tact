struct Variant {
    a: Int;
    b: Int as int8;
    c: Int as uint32;
    d: Bool;
    e: Bool?;
    f: String;
    g: String?;
}

contract FieldVariety {
    payload: Variant;

    init() {
        self.payload = Variant{
            a: -1,
            b: -10,
            c: 1000,
            d: true,
            e: false,
            f: "test",
            g: null,
        };
    }
}
