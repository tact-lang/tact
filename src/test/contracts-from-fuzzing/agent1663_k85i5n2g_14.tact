struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Cell?;
    f11: Slice?;
    f12: Address?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Cell;
    f17: Slice;
    f18: Address;
    f19: Bool?;
    f20: Int?;
}

contract BigFields {
    item: BigStruct;
    init() {
        self.item = BigStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: myAddress(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
            f13: 3,
            f14: false,
            f15: "b",
            f16: emptyCell(),
            f17: emptyCell().asSlice(),
            f18: myAddress(),
            f19: null,
            f20: null
        };
    }
}