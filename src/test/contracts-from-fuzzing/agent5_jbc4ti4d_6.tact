struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: String;
    f8: Int?;
    f9: Bool?;
    f10: Address?;
    f11: Cell?;
    f12: Slice?;
    f13: Builder?;
    f14: String?;
    f15: Int;
    f16: Bool;
    f17: Address;
    f18: Cell;
    f19: Slice;
    f20: Builder;
}

contract WithLargeStruct {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: "test",
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
            f13: null,
            f14: null,
            f15: 2,
            f16: false,
            f17: myAddress(),
            f18: emptyCell(),
            f19: emptyCell().asSlice(),
            f20: beginCell(),
        };
    }
}