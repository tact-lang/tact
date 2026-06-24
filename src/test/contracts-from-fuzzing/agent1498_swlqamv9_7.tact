struct TwentyFields {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Address;
    f8: Address?;
    f9: Cell;
    f10: Cell?;
    f11: Builder;
    f12: Builder?;
    f13: Slice;
    f14: Slice?;
    f15: Int;
    f16: Int?;
    f17: Bool;
    f18: Bool?;
    f19: String;
    f20: String?;
}

contract BigStructHolder {
    data: TwentyFields;

    init() {
        self.data = TwentyFields{
            f1: 1,
            f2: null,
            f3: true,
            f4: null,
            f5: "a",
            f6: null,
            f7: myAddress(),
            f8: null,
            f9: emptyCell(),
            f10: null,
            f11: beginCell(),
            f12: null,
            f13: emptyCell().asSlice(),
            f14: null,
            f15: 15,
            f16: null,
            f17: false,
            f18: null,
            f19: "b",
            f20: null,
        };
    }
}