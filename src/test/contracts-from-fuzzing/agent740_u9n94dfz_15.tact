contract MultiFieldTypes {
    anInt: Int = 1;
    aBool: Bool = false;
    aStr: String = "hi";
    anAddr: Address? = null;
    aCell: Cell;
    aSlice: Slice;

    init() {
        self.anInt = 42;
        self.aBool = true;
        self.aStr = "hello";
        self.anAddr = myAddress();
        self.aCell = emptyCell();
        self.aSlice = emptyCell().asSlice();
    }
}