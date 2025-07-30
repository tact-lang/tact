contract LargeStructStorage {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: true,
            c: "c",
            d: 2,
            e: false,
            f: "f",
            g: 3,
            h: true,
            i: "i",
            j: 4,
            k: false,
            l: "l",
            m: 5,
            n: true,
            o: "o"
        };
    }
}

struct S {
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
}
