struct InnerExtreme {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}
struct OuterExtreme {
    ia: InnerExtreme;
    ib: InnerExtreme;
}

contract ExtremeNesting {
    storage: OuterExtreme;

    init() {
        let inner = InnerExtreme{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
        self.storage = OuterExtreme{
            ia: inner,
            ib: inner,
        };
    }
}
