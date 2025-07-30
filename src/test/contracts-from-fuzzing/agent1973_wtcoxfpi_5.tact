struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
}

contract WithBigStruct {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            a: 1,
            b: false,
            c: "hi",
            d: null,
            e: null,
            f: "there",
            g: 2,
            h: true,
        };
    }
}
