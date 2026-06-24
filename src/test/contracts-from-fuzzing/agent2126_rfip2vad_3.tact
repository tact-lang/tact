struct Deep {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Slice?;
    f8: Bool?;
    f9: Int?;
    f10: String?;
    f11: Address?;
    f12: Cell?;
}

contract TestContract {
    d: Deep;

    init() {
        self.d = Deep{
            f1: 1,
            f2: false,
            f3: "x",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
        };
    }
}
