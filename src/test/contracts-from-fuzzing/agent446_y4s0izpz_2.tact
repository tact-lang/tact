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

contract Test {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: 2,
            f: false,
            g: 3,
            h: true,
            i: 4,
            j: false,
        };
    }
}