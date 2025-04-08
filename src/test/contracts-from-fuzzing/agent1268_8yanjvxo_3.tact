struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
    f8: Bool;
    f9: Int;
    f10: String;
    f11: Bool;
    f12: Address;
    f13: Int;
    f14: String;
    f15: Bool;
    f16: Int;
    f17: Bool;
    f18: String;
    f19: Int;
    f20: Bool;
}

contract TestContract {
    bigField: LongStruct;

    init() {
        self.bigField = LongStruct{
            f1: 1, f2: true, f3: "a", f4: emptyCell(), f5: emptyCell().asSlice(),
            f6: beginCell(), f7: myAddress(), f8: false, f9: 2, f10: "b",
            f11: true, f12: myAddress(), f13: 3, f14: "c", f15: false,
            f16: 4, f17: true, f18: "d", f19: 5, f20: false
        };
    }
}