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
    field: ManyFields;

    init() {
        self.field = ManyFields{
            a: 1, b: true, c: "x",
            d: null, e: false, f: "y",
            g: 2, h: true, i: "z",
            j: 100
        };
    }
}