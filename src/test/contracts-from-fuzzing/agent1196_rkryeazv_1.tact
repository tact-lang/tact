struct NestedStruct {
    innerInt: Int;
    innerBool: Bool;
    innerAddress: Address;
    innerCell: Cell;
    innerSlice: Slice;
    innerString: String;
    innerOptionalInt: Int?;
    innerOptionalAddress: Address?;
}

contract ComplexStorage {
    nested: NestedStruct;
    bigInt: Int;
    flag: Bool;
    dataCell: Cell;
    dataSlice: Slice;
    text: String;
    maybeInt: Int?;
    maybeText: String?;

    init() {
        self.nested = NestedStruct{
            innerInt: 1,
            innerBool: true,
            innerAddress: myAddress(),
            innerCell: emptyCell(),
            innerSlice: emptyCell().asSlice(),
            innerString: "test",
            innerOptionalInt: null,
            innerOptionalAddress: null,
        };
        self.bigInt = 2;
        self.flag = false;
        self.dataCell = emptyCell();
        self.dataSlice = emptyCell().asSlice();
        self.text = "hello";
        self.maybeInt = null;
        self.maybeText = null;
    }
}
