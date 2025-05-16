struct FlatMany {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Slice?;
}

contract ManyFlatStruct {
    v: FlatMany;
    init() {
        self.v = FlatMany{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}