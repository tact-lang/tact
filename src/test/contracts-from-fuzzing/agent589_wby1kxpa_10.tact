struct Many {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: String?;
    l: Cell?;
    m: Slice?;
    n: Builder?;
}

contract Test {
    combined: Many;

    init() {
        self.combined = Many{
            a: 1,
            b: true,
            c: myAddress(),
            d: "dd",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null,
            n: null,
        };
    }
}