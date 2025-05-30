struct SBig {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: String?;
}

contract BigStruct {
    state: SBig;

    init() {
        self.state = SBig{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: "str",
            h: 2,
            i: false,
            j: myAddress(),
            k: "opt"
        };
    }
}