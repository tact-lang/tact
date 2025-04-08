struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Address;
    f7: Bool?;
    f8: String?;
    f9: Int?;
}

contract LotsOfFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "s",
            f4: emptyCell().asSlice(),
            f5: emptyCell(),
            f6: myAddress(),
            f7: null,
            f8: null,
            f9: null
        };
    }
}