struct S1 {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int?;
    f9: Bool?;
    f10: String?;
    f11: Address?;
    f12: Cell?;
    f13: Slice?;
    f14: Builder?;
}

contract TestContract {
    s: S1;

    init() {
        self.s = S1{
            f1: 0,
            f2: false,
            f3: "",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
            f13: null,
            f14: null
        };
    }
}