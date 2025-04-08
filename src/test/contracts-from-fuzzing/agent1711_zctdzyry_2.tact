struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Address;
    f10: Int;
    f11: Bool;
    f12: Int?;
    f13: Bool?;
    f14: String;
    f15: String?;
    f16: Cell;
    f17: Slice;
    f18: Address;
    f19: Int;
    f20: Bool;
}

contract TestManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: null,
            f4: null,
            f5: "a",
            f6: null,
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: myAddress(),
            f10: 10,
            f11: false,
            f12: null,
            f13: null,
            f14: "b",
            f15: null,
            f16: emptyCell(),
            f17: emptyCell().asSlice(),
            f18: myAddress(),
            f19: 19,
            f20: true
        };
    }
}