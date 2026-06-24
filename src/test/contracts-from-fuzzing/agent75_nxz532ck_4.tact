struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool;
    h: String;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Cell;
    n: Slice;
    o: Bool;
    p: String;
    q: Int;
    r: Bool;
    s: String;
    t: Address;
}

contract Test {
    huge: Wide;

    init() {
        self.huge = Wide{
            a: 1, b: true, c: "c", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice(),
            g: false, h: "h", i: 9, j: true, k: "k", l: myAddress(), m: emptyCell(),
            n: emptyCell().asSlice(), o: false, p: "p", q: 17, r: true, s: "s", t: myAddress()
        };
    }
}