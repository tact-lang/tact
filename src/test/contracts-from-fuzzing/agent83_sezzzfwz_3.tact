contract VariantTypes {
    flag: Bool;
    counter: Int as uint32;
    codeCell: Cell;
    someSlice: Slice;
    anAddress: Address;
    someText: String;

    init() {
        self.flag = true;
        self.counter = 123;
        self.codeCell = emptyCell();
        self.someSlice = emptyCell().asSlice();
        self.anAddress = myAddress();
        self.someText = "hello";
    }
}