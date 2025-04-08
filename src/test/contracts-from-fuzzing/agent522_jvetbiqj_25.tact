struct MixedFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Bool?;
    f: String;
    g: Int?;
}

contract MixedOptionalFields {
    data: MixedFields;

    init() {
        self.data = MixedFields{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: null,
            f: "hello",
            g: null,
        };
    }
}