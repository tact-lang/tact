struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: Address;
    f10: Cell;
    f11: Slice;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: Address;
    f16: Cell;
    f17: Slice;
    f18: String;
}

contract BigStorage {
    stuff: ManyFields;

    init() {
        self.stuff = ManyFields{
            f1: 1,
            f2: false,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "hi",
            f7: 2,
            f8: true,
            f9: myAddress(),
            f10: emptyCell(),
            f11: emptyCell().asSlice(),
            f12: "yo",
            f13: 3,
            f14: true,
            f15: myAddress(),
            f16: emptyCell(),
            f17: emptyCell().asSlice(),
            f18: "fin"
        };
    }
}