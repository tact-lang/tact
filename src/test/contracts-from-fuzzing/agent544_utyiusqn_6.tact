struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Bool?;
    f8: Int?;
    f9: Address?;
    f10: String?;
    f11: Slice?;
    f12: Cell?;
    f13: Int;
    f14: Bool;
    f15: Address;
}

contract TestContract {
    s: LargeStruct;

    init() {
        self.s = LargeStruct{
            f1: 1,
            f2: false,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "a",
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
            f13: 2,
            f14: true,
            f15: myAddress(),
        };
    }
}