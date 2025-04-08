struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: String?;
    f: Int;
    g: Bool;
    h: String;
    i: String?;
    j: Int;
}

contract ManyFields {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            a: 1,
            b: 2,
            c: true,
            d: "d",
            e: null,
            f: 6,
            g: false,
            h: "h",
            i: "i",
            j: 10
        };
    }
}