struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool;
    l: String?;
    m: Int;
    n: Bool?;
    o: String;
    p: Int;
    q: Bool;
    r: String?;
    s: Int?;
    t: Bool;
}

contract TestContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a: 1, b: true, c: "x", d: null, e: false, f: "y", g: 2, h: true, i: "z", j: 3,
            k: true, l: null, m: 4, n: null, o: "q", p: 5, q: false, r: null, s: null, t: true,
        };
    }

    receive() {
        self.storage = self.storage;
    }
}
