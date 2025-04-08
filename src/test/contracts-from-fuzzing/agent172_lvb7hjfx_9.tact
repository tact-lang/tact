struct Mix {
    f1: Int;
    f2: Bool?;
    f3: String;
    f4: String?;
    f5: Address;
    f6: Address?;
    f7: Cell;
    f8: Cell?;
    f9: Slice;
    f10: Slice?;
}

contract Test {
    m: Mix;

    init() {
        self.m = Mix{
            f1: 1,
            f2: null,
            f3: "abc",
            f4: null,
            f5: myAddress(),
            f6: null,
            f7: emptyCell(),
            f8: null,
            f9: emptyCell().asSlice(),
            f10: null
        };
    }
}