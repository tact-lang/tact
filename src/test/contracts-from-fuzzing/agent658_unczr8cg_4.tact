contract LargeVariety {
    intVar: Int;
    boolVar: Bool;
    addrVar: Address;
    cellVar: Cell;
    strVar: String;
    optBool: Bool?;
    optInt: Int?;

    init() {
        self.intVar = 1;
        self.boolVar = true;
        self.addrVar = myAddress();
        self.cellVar = emptyCell();
        self.strVar = "hello";
        self.optBool = null;
        self.optInt = 42;
    }
}