struct TenFields {
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
    data: TenFields;

    init() {
        self.data = TenFields{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: false,
            f: "y",
            g: 7,
            h: true,
            i: "z",
            j: 10
        };
    }
}