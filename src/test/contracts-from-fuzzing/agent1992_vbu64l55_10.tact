contract Test {
    valInt: Int;
    valBool: Bool = false;
    valCell: Cell;
    valAddr: Address;
    valStr: String = "hi";

    init() {
        self.valInt = 77;
        self.valCell = emptyCell();
        self.valAddr = myAddress();
    }
}