struct S {
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

contract DeepOptional {
    data: S;

    init() {
        self.data = S{
            f1: 1,
            f2: true,
            f3: "abc",
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