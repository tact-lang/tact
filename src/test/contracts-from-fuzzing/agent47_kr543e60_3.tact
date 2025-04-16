struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Address;
    f11: Address?;
}

contract ContractWithManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "a",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: null,
            f8: null,
            f9: null,
            f10: myAddress(),
            f11: null,
        };
    }
}