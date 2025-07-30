struct ManyFields {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Address;
    f8: Address?;
    f9: Cell;
    f10: Slice;
}

contract Widespread {
    val: ManyFields;

    init() {
        self.val = ManyFields{
            f1: 1,
            f2: "ok",
            f3: true,
            f4: null,
            f5: null,
            f6: null,
            f7: myAddress(),
            f8: null,
            f9: emptyCell(),
            f10: emptyCell().asSlice()
        };
    }
}
