struct LargeStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
    k: String;
    l: Int?;
    m: Bool?;
    n: String?;
    o: Int;
    p: Bool;
    q: String;
    r: Int?;
    s: Bool?;
    t: String?;
}

contract LargeFieldsTest {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            a: 1, b: 2, c: 3, d: 4, e: 5,
            f: true, g: false, h: true,
            i: "a", j: "b", k: "c",
            l: null, m: null, n: null,
            o: 6, p: false, q: "z",
            r: null, s: null, t: null,
        };
    }

    receive() {
        let _ = self.big;
    }
}
