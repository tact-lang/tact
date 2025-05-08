struct Flat {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Builder;
    n: Builder?;
}

contract AllOptBasic {
    f: Flat;
    init() {
        self.f = Flat{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: myAddress(),
            f: null,
            g: "s",
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null,
            m: beginCell(),
            n: null,
        };
    }
}