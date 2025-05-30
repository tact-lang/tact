struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int;
    f5: Bool;
    f6: Address;
    f7: String;
    f8: String;
    f9: Cell;
    f10: Cell;
    f11: Slice;
    f12: Slice;
    f13: Builder;
    f14: Builder;
    f15: Int?;
    f16: String?;
}

contract LargeStructContract {
    state: ManyFields;

    init() {
        self.state = ManyFields{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: 4,
            f5: false,
            f6: myAddress(),
            f7: "hi",
            f8: "world",
            f9: emptyCell(),
            f10: emptyCell(),
            f11: emptyCell().asSlice(),
            f12: emptyCell().asSlice(),
            f13: beginCell(),
            f14: beginCell(),
            f15: null,
            f16: null,
        };
    }
}