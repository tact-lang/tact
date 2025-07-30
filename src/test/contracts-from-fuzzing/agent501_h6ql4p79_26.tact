contract AddressCell {
    addr: Address;
    cellData: Cell;

    init() {
        self.addr = myAddress();
        self.cellData = emptyCell();
    }
}