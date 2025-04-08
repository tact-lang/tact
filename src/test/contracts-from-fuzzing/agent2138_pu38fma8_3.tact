struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
}

contract ExtensiveFields {
    st: BigStruct;

    init() {
        self.st = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: 2,
            f: true,
            g: null,
            h: null,
            i: 3,
            j: false,
        };
    }
}