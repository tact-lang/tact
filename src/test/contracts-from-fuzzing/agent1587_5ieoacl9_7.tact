struct Combo {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String?;
    f: Address;
    g: Cell;
    h: Slice;
}

contract MixedFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: null,
            f: myAddress(),
            g: emptyCell(),
            h: emptyCell().asSlice(),
        };
    }
}