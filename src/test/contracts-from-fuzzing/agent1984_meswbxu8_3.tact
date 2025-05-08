struct LargeStruct {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: Address;
    f6: Address?;
    f7: Cell;
    f8: Cell?;
    f9: Slice;
    f10: Slice?;
    f11: String;
    f12: String?;
}

contract LargeFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 1,
            f2: null,
            f3: true,
            f4: false,
            f5: myAddress(),
            f6: null,
            f7: emptyCell(),
            f8: null,
            f9: emptyCell().asSlice(),
            f10: null,
            f11: "test",
            f12: null,
        };
    }
}