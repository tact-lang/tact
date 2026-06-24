struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Slice?;
    f10: Address?;
    f11: String?;
    f12: Int;
    f13: Bool;
    f14: Cell;
    f15: String;
    f16: Bool?;
    f17: Address;
    f18: Cell;
    f19: Slice?;
    f20: Int;
}

contract LongStructContract {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1: 1,
            f2: false,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "hi",
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: 12,
            f13: true,
            f14: emptyCell(),
            f15: "world",
            f16: null,
            f17: myAddress(),
            f18: emptyCell(),
            f19: null,
            f20: 20
        };
    }
}