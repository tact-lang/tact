struct ManyFieldsStruct {
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
}

contract ManyFieldsNested {
    rec: ManyFieldsStruct;

    init() {
        self.rec = ManyFieldsStruct{
            a: 1,
            b: true,
            c: "one",
            d: null,
            e: false,
            f: null,
            g: 2,
            h: false,
            i: "two",
            j: 100
        };
    }
}