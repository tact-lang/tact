struct ManyFields {
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
    q: Bool;
    r: String;
    s: Int;
    t: Bool;
}

contract WideStruct {
    storage: ManyFields = ManyFields{
        a: 1, b: false, c: "1",
        d: 2, e: true,  f: "2",
        g: 3, h: false, i: "3",
        j: 4, k: true,  l: "4",
        m: 5, n: false, o: "5",
        p: 6, q: true,  r: "6",
        s: 7, t: false
    };

    init() {
        self.storage = ManyFields{
            a: 10, b: true, c: "10",
            d: 20, e: false, f: "20",
            g: 30, h: true,  i: "30",
            j: 40, k: false, l: "40",
            m: 50, n: true,  o: "50",
            p: 60, q: false, r: "60",
            s: 70, t: true
        };
    }
}
