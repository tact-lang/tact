struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Address;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Int?;
    f14: Bool?;
    f15: String?;
    f16: Cell;
    f17: Slice;
    f18: Address;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "a",
            f4: null,
            f5: null,
            f6: null,
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: myAddress(),
            f10: 1,
            f11: false,
            f12: "b",
            f13: null,
            f14: true,
            f15: "string",
            f16: emptyCell(),
            f17: emptyCell().asSlice(),
            f18: myAddress(),
        };
    }
}