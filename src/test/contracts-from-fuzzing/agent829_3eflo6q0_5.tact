struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
    f8: Int?;
    f9: Bool?;
    f10: String?;
}

contract StructInField {
    item: LongStruct;

    init() {
        self.item = LongStruct{
            f1: 1,
            f2: true,
            f3: "abc",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: myAddress(),
            f8: null,
            f9: null,
            f10: null
        };
    }
}