struct LongFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Bool;
    f6: Address;
    f7: String;
    f8: Slice;
    f9: Cell;
    f10: Bool;
    f11: Int;
    f12: String;
}

contract LongFieldsStorage {
    data: LongFields;

    init() {
        self.data = LongFields{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: true,
            f5: false,
            f6: myAddress(),
            f7: "abc",
            f8: emptyCell().asSlice(),
            f9: emptyCell(),
            f10: true,
            f11: 999,
            f12: "xyz",
        };
    }
}