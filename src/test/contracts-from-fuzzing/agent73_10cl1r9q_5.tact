struct BigStruct {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Address;
    f5: Slice;
    f6: Cell;
    f7: Int?;
    f8: String?;
    f9: Bool?;
    f10: Address?;
    f11: Slice?;
    f12: Cell?;
    f13: Int;
    f14: String;
    f15: Bool;
    f16: Address;
    f17: Slice;
    f18: Cell;
    f19: Int?;
    f20: String?;
}

contract BigStructHolder {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            f1: 1,
            f2: "a",
            f3: false,
            f4: myAddress(),
            f5: emptyCell().asSlice(),
            f6: emptyCell(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
            f13: 2,
            f14: "b",
            f15: true,
            f16: myAddress(),
            f17: emptyCell().asSlice(),
            f18: emptyCell(),
            f19: null,
            f20: null,
        };
    }
}