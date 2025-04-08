contract TestContract {
    flag: Bool;
    num: Int;
    addr: Address;
    slice: Slice;
    cell: Cell;
    str: String;

    init() {
        self.flag = true;
        self.num = 42;
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.cell = emptyCell();
        self.str = "Hello";
    }
}