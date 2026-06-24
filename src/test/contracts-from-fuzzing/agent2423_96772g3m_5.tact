struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Address;
}

contract ManyPersistent {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "hi",
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: null,
            f8: false,
            f9: null,
            f10: myAddress()
        };
    }
}