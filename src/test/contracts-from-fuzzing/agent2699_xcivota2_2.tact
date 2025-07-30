struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract WideFieldsTest {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1,
            b: true,
            c: "x",
            d: null,
            e: false,
            f: null,
            g: 42,
            h: false,
            i: "y",
            j: null,
            k: true,
            l: "z",
        };
    }
}