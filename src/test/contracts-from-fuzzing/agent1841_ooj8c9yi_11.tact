struct StructWide {
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
    k: Cell;
    l: Slice;
}

contract WideVariety {
    data: StructWide;

    init() {
        self.data = StructWide{
            a: 1,
            b: false,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: 2,
            i: true,
            j: null,
            k: emptyCell(),
            l: emptyCell().asSlice()
        };
    }
}
