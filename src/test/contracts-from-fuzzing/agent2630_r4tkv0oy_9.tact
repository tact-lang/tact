struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
}

contract ComplexMix {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 99,
            b: true,
            c: "combo",
            d: null,
            e: emptyCell(),
            f: null
        };
    }
}