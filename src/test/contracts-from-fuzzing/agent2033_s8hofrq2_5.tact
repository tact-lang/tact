struct LargeNest {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract Test {
    s: LargeNest;

    init() {
        self.s = LargeNest{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: false,
            f: null,
            g: 2,
            h: false,
            i: "i"
        };
    }
}