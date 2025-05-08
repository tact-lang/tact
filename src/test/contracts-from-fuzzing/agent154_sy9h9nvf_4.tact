struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: Cell;
    f7: Slice;
    f8: Address;
    f9: String?;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Int?;
    f14: Bool?;
    f15: Cell;
    f16: Slice;
    f17: Address;
    f18: String?;
    f19: Int;
    f20: Bool;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: false,
            f6: emptyCell(),
            f7: emptyCell().asSlice(),
            f8: myAddress(),
            f9: null,
            f10: 10,
            f11: false,
            f12: "b",
            f13: 13,
            f14: true,
            f15: emptyCell(),
            f16: emptyCell().asSlice(),
            f17: myAddress(),
            f18: "x",
            f19: 19,
            f20: true,
        };
    }
}