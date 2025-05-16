struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Builder;
    f7: Slice;
    f8: Int;
    f9: Bool;
    f10: Address;
    f11: String;
    f12: Cell;
    f13: Builder;
    f14: Slice;
}

contract ContainsBigStruct {
    data: BigStruct;

    init() {
        self.data = BigStruct {
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "A",
            f5: emptyCell(),
            f6: beginCell(),
            f7: emptyCell().asSlice(),
            f8: 8,
            f9: false,
            f10: myAddress(),
            f11: "B",
            f12: emptyCell(),
            f13: beginCell(),
            f14: emptyCell().asSlice(),
        };
    }
}