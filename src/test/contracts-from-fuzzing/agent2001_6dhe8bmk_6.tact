struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
}

contract StructField {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}