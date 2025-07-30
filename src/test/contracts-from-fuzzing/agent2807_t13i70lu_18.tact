contract MultiFields {
    x: Int;
    y: Int;
    flag: Bool;
    addr: Address;
    txt: String;
    c: Cell;
    s: Slice;

    init() {
        self.x = 1;
        self.y = 2;
        self.flag = true;
        self.addr = myAddress();
        self.txt = "abc";
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
    }
}