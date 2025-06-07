struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: String?;
}

contract TestContract {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "Hello",
            f7: null,
            f8: false,
            f9: null,
            f10: null,
        };
    }
}