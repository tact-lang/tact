struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: String?;
    l: Bool?;
}

contract ManyFieldsContract {
    record: ManyFields;

    init() {
        self.record = ManyFields{
            a: 1,
            b: false,
            c: "a",
            d: null,
            e: null,
            f: null,
            g: 2,
            h: true,
            i: "b",
            j: 3,
            k: "c",
            l: false,
        };
    }
}
