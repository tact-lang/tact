struct AddressAndCell {
    addr: Address;
    cellVal: Cell;
}

contract TestContract {
    f: AddressAndCell;

    init() {
        self.f = AddressAndCell{
            addr: myAddress(),
            cellVal: emptyCell()
        };
    }
}