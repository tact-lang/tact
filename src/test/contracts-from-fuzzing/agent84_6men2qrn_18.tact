contract MixPrimitives {
    flag: Bool;
    number: Int;
    addr: Address;
    text: String;
    cellData: Cell;
    sliceData: Slice;
    optionalBool: Bool?;
    optionalInt: Int?;
    optionalText: String?;

    init() {
        self.flag = true;
        self.number = 123456;
        self.addr = myAddress();
        self.text = "Hello";
        self.cellData = emptyCell();
        self.sliceData = emptyCell().asSlice();
        self.optionalBool = null;
        self.optionalInt = null;
        self.optionalText = null;
    }
}