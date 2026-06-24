contract TestContract {
    num: Int;
    flag: Bool;
    addr: Address;
    str: String;
    cl: Cell;

    init() {
        self.num = 1;
        self.flag = true;
        self.addr = myAddress();
        self.str = "text";
        self.cl = emptyCell();
    }
}
