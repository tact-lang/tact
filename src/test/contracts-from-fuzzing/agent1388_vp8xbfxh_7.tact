struct Big {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
    k: Cell;
    l: Cell;
    m: Slice;
    n: Slice;
    o: Address?;
    p: Address?;
    q: Int?;
    r: Int?;
    s: Bool?;
    t: Bool?;
}

contract Test {
    big: Big;

    init() {
        self.big = Big{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6,
            g: false, h: true,
            i: "i", j: "j",
            k: emptyCell(), l: emptyCell(),
            m: "".asComment().asSlice(), n: "".asComment().asSlice(),
            o: null, p: null, q: null, r: null, s: null, t: null
        };
    }
}
