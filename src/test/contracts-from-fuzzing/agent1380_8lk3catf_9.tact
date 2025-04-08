struct LongStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: Bool?;
    k: String;
    l: String?;
    m: Int;
    n: Int?;
    o: Bool;
    p: Bool?;
    q: String;
    r: String?;
    s: Int;
    t: Int?;
}

contract LongStructTest {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            a: 1, b: null, c: true, d: null, e: "e", f: null,
            g: 7, h: null, i: false, j: null, k: "k", l: null,
            m: 13, n: null, o: true, p: null, q: "q", r: null,
            s: 21, t: null
        };
    }
}