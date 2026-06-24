struct Combo {
    n: Int?;
    b: Bool;
    s: String;
    c: Cell;
}

contract MixedFields {
    combo: Combo;

    init() {
        self.combo = Combo {
            n: null,
            b: true,
            s: "hi",
            c: emptyCell()
        };
    }
}