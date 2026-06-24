struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: String?;
    e: Cell;
    f: Address?;
}

contract MixedOptionality {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 1,
            b: null,
            c: false,
            d: null,
            e: emptyCell(),
            f: null
        };
    }
}