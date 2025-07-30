struct BigNested2 {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Int;
    k: Bool;
    l: String;
}

contract LargerStruct {
    storage: BigNested2;

    init() {
        self.storage = BigNested2{
            a: null, b: null, c: null,
            d: 1, e: true, f: "x",
            g: null, h: false, i: null,
            j: 7, k: false, l: "y"
        };
    }
}