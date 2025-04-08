struct WideFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Bool?;
    f8: Address?;
    f9: Cell?;
    f10: Int?;
}

contract WideTest {
    val: WideFields;

    init() {
        self.val = WideFields{
            f1: 1, f2: true, f3: myAddress(), f4: emptyCell(), f5: emptyCell().asSlice(), f6: "test",
            f7: false, f8: null, f9: null, f10: 42
        };
    }
}