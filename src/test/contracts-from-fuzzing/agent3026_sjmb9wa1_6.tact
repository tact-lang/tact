struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Slice;
    f5: String;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: Cell?;
}

contract HugeStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 0,
            f2: false,
            f3: emptyCell(),
            f4: emptyCell().asSlice(),
            f5: "",
            f6: myAddress(),
            f7: null,
            f8: null,
            f9: null
        };
    }
}