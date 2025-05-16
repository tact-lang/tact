contract InitMixed {
    i: Int = 0;
    u8: Int as uint8 = 1;
    flag: Bool = false;
    txt: String = "x";
    addr: Address;
    cell: Cell;
    slice: Slice;

    init() {
        self.addr = myAddress();
        self.cell = emptyCell();
        self.slice = self.cell.asSlice();
    }
}