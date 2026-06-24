struct Big {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell;
    j: Slice;
    k: Address?;
}

contract ManyFieldTypes {
    data: Big;
    init() {
        self.data = Big{
            a: 1,
            b: 2,
            c: 3,
            d: true,
            e: "ok",
            f: null,
            g: null,
            h: null,
            i: emptyCell(),
            j: emptyCell().asSlice(),
            k: null,
        };
    }
}
