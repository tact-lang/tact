struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Address;
    f6: Int?;
    f7: Bool;
    f8: String?;
    f9: Cell;
    f10: Int;
}

contract ManyFields {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f1: 1,
            f2: true,
            f3: "a",
            f4: emptyCell().asSlice(),
            f5: myAddress(),
            f6: null,
            f7: false,
            f8: "opt",
            f9: emptyCell(),
            f10: 34
        };
    }
}