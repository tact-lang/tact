struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: String;
    f9: Int;
    f10: Bool;
}

contract LargeStruct {
    dat: ManyFields;

    init() {
        self.dat = ManyFields{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "abc",
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
            f8: "def",
            f9: 9,
            f10: false
        };
    }
}