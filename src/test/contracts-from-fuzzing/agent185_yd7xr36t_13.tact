struct BigAddressCell {
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;
}

contract AddressCellTest {
    data: BigAddressCell;
    init() {
        self.data = BigAddressCell{
            addr1: myAddress(),
            addr2: myAddress(),
            cell1: emptyCell(),
            cell2: emptyCell()
        };
    }
}
