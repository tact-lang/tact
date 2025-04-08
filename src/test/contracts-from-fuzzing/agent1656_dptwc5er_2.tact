struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract ManyFieldsTest {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: false,
            f: "s",
            g: 42,
            h: false,
            i: "y",
            j: 100,
        };
    }
}
