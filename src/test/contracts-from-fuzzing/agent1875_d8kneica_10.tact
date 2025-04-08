struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell?;
    e: Slice;
    f: Address?;
    g: Int;
    h: Bool;
}

contract FuzzCombo {
    combo: Combo;

    init() {
        self.combo = Combo {
            a: 11,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: sender(),
            g: 22,
            h: false
        };
    }
}
