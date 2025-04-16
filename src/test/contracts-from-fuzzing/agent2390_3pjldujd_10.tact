struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: Address;
    f7: Slice;
    f8: Cell;
    f9: Int;
    f10: Bool;
    f11: Cell;
    f12: Address;
}

contract ManyTypes {
    s: LongStruct;
    init() {
        self.s = LongStruct{
            f1: 1,
            f2: false,
            f3: "abc",
            f4: null,
            f5: true,
            f6: myAddress(),
            f7: emptyCell().asSlice(),
            f8: emptyCell(),
            f9: 99,
            f10: true,
            f11: emptyCell(),
            f12: myAddress(),
        };
    }
}