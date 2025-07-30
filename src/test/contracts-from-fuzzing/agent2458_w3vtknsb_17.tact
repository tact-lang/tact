// Very large struct with over 20 fields
struct VeryLarge {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: String?;
    l: Bool?;
    m: Int;
    n: Bool;
    o: String;
    p: Int;
    q: Bool?;
    r: Int?;
    s: String;
    t: Int;
    u: Bool;
    v: String?;
    w: Int?;
}

contract TestContract {
    big: VeryLarge;

    init() {
        self.big = VeryLarge{
            a: 1,
            b: 2,
            c: true,
            d: "d",
            e: null,
            f: null,
            g: 3,
            h: false,
            i: "i",
            j: 4,
            k: null,
            l: null,
            m: 5,
            n: true,
            o: "o",
            p: 6,
            q: null,
            r: null,
            s: "s",
            t: 7,
            u: false,
            v: null,
            w: null,
        };
    }
}