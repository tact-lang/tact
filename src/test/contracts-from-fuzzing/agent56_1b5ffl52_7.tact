struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool;
}

contract MixFields {
    field: Combo;

    init() {
        self.field = Combo{
            a: -42,
            b: null,
            c: "hi",
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: 100,
            h: true,
        };
    }
}