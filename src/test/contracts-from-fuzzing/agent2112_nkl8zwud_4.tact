struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Int?;
    f7: Address;
    f8: String?;
    f9: Bool?;
    f10: Int;
}

contract DiverseFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "test",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: null,
            f7: myAddress(),
            f8: null,
            f9: true,
            f10: 42
        };
    }
}