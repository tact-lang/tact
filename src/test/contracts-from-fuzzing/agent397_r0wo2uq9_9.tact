struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
}

contract MixOptionals {
    data: Combo;

    init() {
        self.data = Combo{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "e",
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null
        };
    }
}