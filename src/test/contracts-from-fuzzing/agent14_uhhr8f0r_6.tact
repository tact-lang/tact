struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: String;
    f8: Int?;
    f9: String?;
    f10: Bool?;
}

contract Test {
    data: ManyFields;

    init() {
        self.data = ManyFields {
            f1: 1,
            f2: 2,
            f3: true,
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: "abc",
            f8: null,
            f9: null,
            f10: null,
        };
    }
}