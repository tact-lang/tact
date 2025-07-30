struct BigStruct {
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

contract LotsOfFields {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: "a",
            d: null,
            e: false,
            f: "b",
            g: 7,
            h: false,
            i: "c",
            j: 42,
        };
    }
}