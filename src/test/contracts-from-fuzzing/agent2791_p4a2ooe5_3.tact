struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Int;
    n: Bool;
    o: String;
    p: Int;
}

contract TestContract {
    bigField: BigStruct;

    init() {
        self.bigField = BigStruct{
            a: 1, b: true, c: "x",
            d: 2, e: false, f: "y",
            g: 3, h: true, i: "z",
            j: 4, k: false, l: "w",
            m: 5, n: true, o: "v",
            p: 6,
        };
    }
}
