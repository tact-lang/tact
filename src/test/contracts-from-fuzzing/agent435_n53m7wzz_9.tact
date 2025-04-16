struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Bool?;
    g: String?;
    h: Int?;
    i: Int;
    j: Bool;
    k: String;
    l: Bool?;
    m: String?;
    n: Int?;
}

contract BigPersistent {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1, b: 2, c: 3, d: true, e: "x", f: null, g: null, h: null,
            i: 4, j: false, k: "y", l: false, m: "zz", n: 99
        };
    }
}