struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
    f8: Int?;
    f9: String;
    f10: Bool;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "a",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: myAddress(),
            f8: null,
            f9: "b",
            f10: false
        };
    }
}
