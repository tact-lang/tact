struct AddressCell {
    addr: Address;
    cell: Cell;
    optAddr: Address?;
    optCell: Cell?;
}

contract Test {
    ac: AddressCell;
    init() {
        self.ac = AddressCell{
            addr: myAddress(),
            cell: emptyCell(),
            optAddr: null,
            optCell: null
        };
    }
}