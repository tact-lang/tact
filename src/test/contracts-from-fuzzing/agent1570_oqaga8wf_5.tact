struct WithManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
    f8: Bool?;
    f9: Int?;
    f10: String;
    f11: Int;
}

contract ManyFieldsContract {
    payload: WithManyFields;

    init() {
        self.payload = WithManyFields{
            f1: 1,
            f2: false,
            f3: "abc",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: myAddress(),
            f8: null,
            f9: 999,
            f10: "xyz",
            f11: 42
        };
    }
}