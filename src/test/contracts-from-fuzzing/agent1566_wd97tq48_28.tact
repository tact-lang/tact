struct ManyDiff {
    a: Int;
    b: String;
    c: Bool;
    d: Cell;
    e: Slice;
    f: Int?;
    g: String?;
    h: Bool?;
    i: Cell?;
    j: Slice?;
}

contract ManyDiffFields {
    s: ManyDiff;

    init() {
        self.s = ManyDiff{
            a: 1,
            b: "b",
            c: true,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}
