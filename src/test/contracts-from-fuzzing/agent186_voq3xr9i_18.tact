struct BigStruct {
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
    k: Bool?;
    l: String?;
}

contract BigStorage {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1, b: false, c: "a", d: null, e: null, f: "bbb",
            g: 42, h: true, i: "cc", j: null, k: true, l: null
        };
    }
}