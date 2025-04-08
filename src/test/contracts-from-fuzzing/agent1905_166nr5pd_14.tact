struct Combo {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Cell;
    f: Slice?;
}

contract ComboFieldsStorage {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: 5,
            b: null,
            c: "hi",
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}