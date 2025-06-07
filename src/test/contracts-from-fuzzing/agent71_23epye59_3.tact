struct ManyFields {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: String;
    f8: Bool?;
    f9: String?;
    f10: Address?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: null,
            f3: true,
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: "hello",
            f8: false,
            f9: null,
            f10: null,
        };
    }
}