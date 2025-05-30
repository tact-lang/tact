struct LongFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: Bool = true;
    f: String = "X";
    g: Int = 7;
    h: Bool?;
    i: String?;
    j: Int = 10;
    k: Bool;
}

contract ManyFieldsStorage {
    fields: LongFields;

    init() {
        self.fields = LongFields{
            a: 11,
            b: true,
            c: "test",
            d: 5,
            e: false,
            f: "Y",
            g: -1,
            h: null,
            i: null,
            j: 101,
            k: false
        };
    }
}
