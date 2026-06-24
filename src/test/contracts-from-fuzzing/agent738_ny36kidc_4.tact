struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String?;
    s: Address;
    t: Address?;
    u: Cell;
    v: Cell?;
    w: Slice;
    x: Slice?;
    y: Int;
    z: Bool;
}

contract FatStructStorage {
    bigData: ManyFields;

    init() {
        self.bigData = ManyFields{
            a: 1, b: true, c: "a", d: null, e: false, f: null,
            g: myAddress(), h: null, i: emptyCell(), j: null, k: emptyCell().asSlice(), l: null,
            m: 2, n: false, o: "b", p: null, q: true, r: null,
            s: myAddress(), t: null, u: emptyCell(), v: null, w: emptyCell().asSlice(), x: null,
            y: 3, z: true,
        };
    }
}