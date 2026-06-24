contract DeepOptionals {
    val: Int?;
    flag: Bool?;
    addr: Address?;
    cellValue: Cell?;

    init() {
        self.val = null;
        self.flag = true;
        self.addr = null;
        self.cellValue = null;
    }
}