struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: String?;
    f9: Bool?;
    f10: Address?;
    f11: Cell?;
    f12: Slice?;
}

contract Test7 {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            f1: 1,
            f2: true,
            f3: "test",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
            f12: null,
        };
    }

    receive() {}
}