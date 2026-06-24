contract TestContract {
    num: Int;
    txt: String;
    addr: Address;
    flag: Bool;
    cellData: Cell;

    init() {
        self.num = 42;
        self.txt = "hello";
        self.addr = myAddress();
        self.flag = true;
        self.cellData = emptyCell();
    }
}