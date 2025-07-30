struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: String?;
    f9: Bool?;
    f10: Int?;
}

contract TestLargeStruct {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f1: 1,
            f2: true,
            f3: "s",
            f4: myAddress(),
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
            f8: "opt",
            f9: null,
            f10: 123,
        };
    }
}
