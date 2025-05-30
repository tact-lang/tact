struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Builder;
    f10: Address;
}

contract LargeFieldsTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: true,
            f3: "str",
            f4: null,
            f5: null,
            f6: null,
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: beginCell(),
            f10: myAddress()
        };
    }
}