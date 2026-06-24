struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Slice;
    f6: Cell;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Address?;
}

contract ManyFields {
    st: LongStruct;

    init() {
        self.st = LongStruct{
            f1: 10,
            f2: true,
            f3: "abc",
            f4: myAddress(),
            f5: emptyCell().asSlice(),
            f6: emptyCell(),
            f7: null,
            f8: null,
            f9: null,
            f10: null
        };
    }
}