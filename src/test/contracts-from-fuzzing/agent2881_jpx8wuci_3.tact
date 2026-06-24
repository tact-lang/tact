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
    f10: Cell;
    f11: Slice;
    f12: Address;
}

contract ManyFieldsTest {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: myAddress(),
            f7: null,
            f8: false,
            f9: null,
            f10: emptyCell(),
            f11: emptyCell().asSlice(),
            f12: myAddress()
        };
    }
}