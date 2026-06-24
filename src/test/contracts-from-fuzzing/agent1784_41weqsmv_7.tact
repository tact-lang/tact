struct ComplexStruct {
    num: Int;
    flag: Bool;
    text: String;
    data: Cell;
    sliceData: Slice;
    builderData: Builder;
    optNum: Int?;
    optText: String?;
    optData: Cell?;
}

contract TestContract {
    field: ComplexStruct;
    init() {
        self.field = ComplexStruct{
            num: 1,
            flag: true,
            text: "abc",
            data: emptyCell(),
            sliceData: emptyCell().asSlice(),
            builderData: beginCell(),
            optNum: null,
            optText: null,
            optData: null
        };
    }
}