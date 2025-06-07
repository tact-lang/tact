struct Wide {
    a: Int;
    b: Int as uint16;
    c: Bool;
    d: Bool;
    e: String;
    f: String?;
    g: Int as uint8;
    h: Int as uint32;
    i: Bool;
    j: String;
    k: Address;
    l: Bool;
    m: Int;
    n: String?;
    o: Bool;
    p: Int as uint64;
    q: Address;
    r: Bool;
    s: String;
    t: Int as uint16;
    u: Bool;
    v: Int;
}

contract TestContract {
    massive: Wide;

    init() {
        self.massive = Wide{
            a: 1, b: 2, c: true, d: false, e: "e",
            f: null, g: 7, h: 800, i: false, j: "j",
            k: myAddress(), l: true, m: 12, n: "n",
            o: true, p: 9999, q: myAddress(), r: false,
            s: "string", t: 16, u: true, v: 42,
        };
    }
}