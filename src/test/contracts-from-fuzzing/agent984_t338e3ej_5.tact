struct Big {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Bool?;
    f8: Int?;
    f9: String;
    f10: Bool;
}

contract ManyFieldsContract {
    big: Big;

    init() {
        self.big = Big{
            f1: 1, f2: true, f3: "abc", f4: myAddress(),
            f5: emptyCell(), f6: emptyCell().asSlice(),
            f7: null, f8: null, f9: "def", f10: false
        };
    }
}