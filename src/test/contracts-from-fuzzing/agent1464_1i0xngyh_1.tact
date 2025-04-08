contract Test {
    num: Int;
    flag: Bool;
    text: String;
    addr: Address;
    data: Cell;
    part: Slice;

    init() {
        self.num = 1;
        self.flag = true;
        self.text = "test";
        self.addr = myAddress();
        self.data = emptyCell();
        self.part = self.data.asSlice();
    }
}
