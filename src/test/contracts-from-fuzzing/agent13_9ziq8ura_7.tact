struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool?;
    e: Int?;
    f: Bool;
    g: Int;
    h: Bool?;
    i: Int?;
    j: Bool;
}

contract LargeNested {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1, b: 2, c: true, d: null, e: null,
            f: false, g: 3, h: null, i: null, j: true
        };
    }
}