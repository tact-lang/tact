struct BigNested {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Address;
    l: Address?;
    m: Builder;
}

contract WithBigNested {
    big: BigNested;

    init() {
        self.big = BigNested{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "abc",
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: myAddress(),
            l: null,
            m: beginCell()
        };
    }
}