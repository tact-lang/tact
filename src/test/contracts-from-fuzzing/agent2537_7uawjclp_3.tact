contract ManyTypes {
    intVal: Int as int64;
    flag: Bool;
    text: String;
    optInt: Int?;
    optFlag: Bool?;
    cellVal: Cell;
    addr: Address;

    init() {
        self.intVal = 1234;
        self.flag = false;
        self.text = "Hello";
        self.optInt = null;
        self.optFlag = true;
        self.cellVal = emptyCell();
        self.addr = myAddress();
    }
}