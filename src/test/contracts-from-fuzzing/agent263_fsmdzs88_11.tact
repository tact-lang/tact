struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Cell;
    e: Slice?;
}

contract ComboFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 10,
            b: null,
            c: "hey",
            d: emptyCell(),
            e: null
        };
    }
}