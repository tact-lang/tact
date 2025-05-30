struct ComplexOrdering {
    a: Int as uint8;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Int as int64;
    o: Int as uint64;
    p: Int as int256;
    q: Int as uint256;
}

contract TestContract {
    data: ComplexOrdering;

    init() {
        self.data = ComplexOrdering{
            a: 42,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null,
            n: -500,
            o: 500,
            p: -1000000,
            q: 1000000
        };
    }
}