struct Combo {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: String;
    f9: Slice;
}

contract ComplexFields {
    combo: Combo;

    init() {
        self.combo = Combo{
            f1: 1,
            f2: false,
            f3: "hi",
            f4: emptyCell(),
            f5: myAddress(),
            f6: null,
            f7: null,
            f8: "test",
            f9: emptyCell().asSlice()
        };
    }
}
