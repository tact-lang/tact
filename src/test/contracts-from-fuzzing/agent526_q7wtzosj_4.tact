struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Cell?;
    f11: Slice?;
    f12: Address?;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: myAddress(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
        };
    }
}
