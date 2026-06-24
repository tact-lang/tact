struct LongStruct {
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

contract ManyFieldsStorage {
    big: LongStruct;

    init() {
        self.big = LongStruct{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null,
            g: 7,
            h: false,
            i: "bye",
            j: null,
        };
    }
}
