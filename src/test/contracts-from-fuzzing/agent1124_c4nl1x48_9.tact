struct BigStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Int;
    h: Bool?;
    i: String;
    j: Int?;
    k: Bool;
}

contract BigStructStorage {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1, b: null, c: "hi", d: 4, e: true, f: null, g: 7,
            h: false, i: "test", j: 99, k: false
        };
    }
}