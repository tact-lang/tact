struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: Slice?;
    l: String?;
    m: Int;
    n: Bool;
    o: String?;
    p: Int;
    q: Bool?;
    r: Int?;
    s: Slice;
    t: Address;
}

contract Test {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "foo",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: 2,
            n: false,
            o: null,
            p: 3,
            q: null,
            r: null,
            s: emptyCell().asSlice(),
            t: myAddress(),
        };
    }
}