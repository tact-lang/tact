contract TestContract {
    n: Int;
    flag: Bool;
    s: String;
    cell: Cell;
    addr: Address;

    init() {
        self.n = 123;
        self.flag = false;
        self.s = "str";
        self.cell = emptyCell();
        self.addr = myAddress();
    }
}