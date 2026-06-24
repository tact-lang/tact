contract ManyPrimitiveFields {
    i: Int;
    j: Int?;
    flag1: Bool;
    flag2: Bool?;
    addr: Address;
    optAddr: Address?;
    cellData: Cell;
    optCell: Cell?;
    txt: String;
    optTxt: String?;

    init() {
        self.i = 42;
        self.j = 7;
        self.flag1 = false;
        self.flag2 = true;
        self.addr = myAddress();
        self.optAddr = myAddress();
        self.cellData = emptyCell();
        self.optCell = emptyCell();
        self.txt = "hello";
        self.optTxt = "world";
    }
}