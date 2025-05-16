struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int;
    f: String;
    g: Bool;
    h: Int;
    i: String;
    j: Bool?;
    k: Bool;
    l: Int;
    m: String;
    n: Int;
    o: String;
    p: Bool;
    q: Int;
    r: String;
    s: Bool;
    t: Int;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a: 1, b: true, c: "a", d: null, e: 2, f: "b", g: false, h: 3, i: "c", j: true,
            k: false, l: 4, m: "d", n: 5, o: "e", p: true, q: 6, r: "f", s: false, t: 7
        };
    }
}