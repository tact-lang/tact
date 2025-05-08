contract LateInitTest {
    addr: Address;
    data: Cell;

    init() {
        self.addr = myAddress();
        self.data = emptyCell();
    }
}