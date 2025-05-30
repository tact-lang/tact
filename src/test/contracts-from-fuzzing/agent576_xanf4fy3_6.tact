struct Lots {
    a: Bool;
    b: Int;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Bool;
    h: Int;
    i: String;
    j: Bool;
    k: Int;
}

contract StructBig {
    stuff: Lots;

    init() {
        self.stuff = Lots{
            a: false,
            b: 1,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: true,
            h: 42,
            i: "bye",
            j: true,
            k: 3
        };
    }
}
