struct LongStruct {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: Address;
    f6: Address?;
    f7: Cell;
    f8: Cell?;
    f9: Slice;
    f10: Slice?;
    f11: Builder;
    f12: Builder?;
    f13: String;
    f14: String?;
    f15: Int;
}

contract TestContract {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f1: 1,
            f2: null,
            f3: true,
            f4: null,
            f5: myAddress(),
            f6: null,
            f7: emptyCell(),
            f8: null,
            f9: emptyCell().asSlice(),
            f10: null,
            f11: beginCell(),
            f12: null,
            f13: "foo",
            f14: null,
            f15: 42,
        };
    }
}