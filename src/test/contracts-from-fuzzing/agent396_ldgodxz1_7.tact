contract Test {
    count: Int?;
    flag: Bool?;
    addr: Address?;
    txt: String?;
    cell_value: Cell?;

    init() {
        self.count = null;
        self.flag = null;
        self.addr = null;
        self.txt = null;
        self.cell_value = null;
    }

    receive() { return; }
}