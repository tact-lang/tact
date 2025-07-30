struct LargeStruct {
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

contract LargeFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1: 0,
            f2: false,
            f3: "",
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