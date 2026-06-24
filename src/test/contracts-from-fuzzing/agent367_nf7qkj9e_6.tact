struct FlatMany {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
    k: String?;
    l: Slice?;
}

contract TestFlatMany {
    data: FlatMany;

    init() {
        self.data = FlatMany{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: "test",
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}