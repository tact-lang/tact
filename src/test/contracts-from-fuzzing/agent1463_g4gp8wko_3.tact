struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool;
    g: Int;
    h: String;
    i: Bool?;
}

contract ManyFieldsTest {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: "e",
            f: false,
            g: 7,
            h: "h",
            i: null,
        };
    }
}
