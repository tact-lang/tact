struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Bool?;
    f9: String?;
    f10: Address?;
}

contract StructFieldContract {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: false,
            f3: myAddress(),
            f4: "struct",
            f5: emptyCell(),
            f6: emptyCell().asSlice(),
            f7: beginCell(),
            f8: null,
            f9: null,
            f10: null
        };
    }
}