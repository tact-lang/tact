struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Address;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "a",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: 2,
            f8: false,
            f9: "b",
            f10: myAddress()
        };
    }
}