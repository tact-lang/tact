struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Bool;
}

contract LotOfFieldsTest {
    m: ManyFields;
    init() {
        self.m = ManyFields{
            f1: 1,
            f2: false,
            f3: myAddress(),
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: "abc",
            f7: null,
            f8: null,
            f9: "def",
            f10: true
        };
    }
}