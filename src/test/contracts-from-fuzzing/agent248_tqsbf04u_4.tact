struct BigStruct {
    a: Int;
    b: String?;
    c: Bool;
    d: Int as uint32;
    e: String;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

contract BigStructHolder {
    bigField: BigStruct;

    init() {
        self.bigField = BigStruct{
            a: 1,
            b: null,
            c: true,
            d: 12345,
            e: "abc",
            f: false,
            g: -77,
            h: "def",
            i: false,
            j: 999
        };
    }
}