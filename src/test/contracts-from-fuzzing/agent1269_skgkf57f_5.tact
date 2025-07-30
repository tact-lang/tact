struct BigStruct {
    f1: Int;
    f2: Int?;
    f3: Int;
    f4: Bool;
    f5: Bool?;
    f6: String;
    f7: String?;
    f8: Address;
    f9: Address?;
    f10: Cell;
    f11: Cell?;
    f12: Slice;
    f13: Slice?;
}

contract VariedFields {
    storage: BigStruct;

    init() {
        self.storage = BigStruct {
            f1: 1,
            f2: null,
            f3: -1,
            f4: true,
            f5: false,
            f6: "hello",
            f7: null,
            f8: myAddress(),
            f9: null,
            f10: emptyCell(),
            f11: null,
            f12: emptyCell().asSlice(),
            f13: null,
        };
    }
}
