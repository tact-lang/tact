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
    l: String?;
    m: Int;
    n: Bool?;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1, b: null, c: "c", d: 4, e: true, f: null, g: 7,
            h: false, i: "i", j: null, k: false, l: "l", m: 13, n: true
        };
    }
}