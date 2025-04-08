struct Combo {
    x1: Int;
    x2: Bool;
    x3: Int?;
    x4: Bool?;
    x5: String;
    x6: String?;
    x7: Cell;
    x8: Cell?;
    x9: Slice;
    x10: Slice?;
}

contract ComboTest {
    val: Combo;

    init() {
        self.val = Combo{
            x1: 1,
            x2: false,
            x3: null,
            x4: null,
            x5: "abc",
            x6: null,
            x7: emptyCell(),
            x8: null,
            x9: emptyCell().asSlice(),
            x10: null,
        };
    }
}