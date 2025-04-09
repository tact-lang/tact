struct Massive {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: Int;
    f: String;
    g: Bool?;
    h: Int;
    i: String;
    j: Bool?;
    k: Int;
    l: String;
    m: Bool?;
    n: Int;
    o: String;
    p: Bool?;
    q: Int;
    r: String;
    s: Bool?;
    t: Int;
}

contract BigStructContract {
    data: Massive;

    init() {
        self.data = Massive{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: 2,
            f: "f",
            g: null,
            h: 3,
            i: "i",
            j: null,
            k: 4,
            l: "l",
            m: null,
            n: 5,
            o: "o",
            p: null,
            q: 6,
            r: "r",
            s: null,
            t: 7,
        };
    }
}