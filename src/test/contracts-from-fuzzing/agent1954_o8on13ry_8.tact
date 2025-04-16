struct Mixed {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
}

contract AllMixedIn {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: null,
            j: null,
            k: null,
        };
    }
}
