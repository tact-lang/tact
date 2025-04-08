struct ManyMixedFields {
    a: Int;
    b: Int as uint8;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int as int32;
    h: Int?;
    i: Bool;
    j: String?;
}

contract ManyMixedPersist {
    field: ManyMixedFields;

    init() {
        self.field = ManyMixedFields{
            a: 1, b: 255, c: true, d: null, e: "hello",
            f: "optional", g: -99, h: 7, i: false, j: null
        };
    }
}