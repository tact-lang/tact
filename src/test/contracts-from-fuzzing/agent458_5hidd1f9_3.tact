struct LotsOfFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: Address?;
    f10: Cell?;
    f11: String?;
    f12: Slice;
}

contract ManyFieldsTest {
    data: LotsOfFields;

    init() {
        self.data = LotsOfFields{
            f1: 1, f2: true, f3: myAddress(), f4: emptyCell(), f5: emptyCell().asSlice(),
            f6: "test", f7: null, f8: null, f9: null, f10: null, f11: null, f12: emptyCell().asSlice()
        };
    }
}
