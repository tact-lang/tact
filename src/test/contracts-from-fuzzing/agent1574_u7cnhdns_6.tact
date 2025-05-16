struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Bool?;
    i: String;
    j: String;
    k: Bool;
    l: Int;
    m: Int;
    n: Int;
    o: Bool;
    p: String;
    q: String;
    r: Bool?;
    s: Int;
    t: Bool;
}

contract BigStorage {
    giant: LargeStruct;

    init() {
        self.giant = LargeStruct{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6, g: true,
            h: false, i: "one", j: "two", k: true, l: 12, m: 13, n: 14,
            o: false, p: "P", q: "Q", r: null, s: 99, t: true
        };
    }
}