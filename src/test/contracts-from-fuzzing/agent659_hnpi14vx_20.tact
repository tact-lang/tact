struct BoolPack {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
    e: Bool;
    f: Bool?;
    g: Bool;
    h: Bool?;
    i: Bool;
    j: Bool?;
    k: Bool;
    l: Bool?;
    m: Bool;
    n: Bool?;
    o: Bool;
    p: Bool?;
    q: Bool;
    r: Bool?;
    s: Bool;
    t: Bool?;
}

contract TestContract {
    flags: BoolPack;

    init() {
        self.flags = BoolPack{
            a: true, b: null, c: false, d: true, e: false,
            f: null, g: true, h: null, i: false, j: true,
            k: false, l: null, m: true, n: null, o: true,
            p: null, q: false, r: null, s: true, t: null,
        };
    }
}