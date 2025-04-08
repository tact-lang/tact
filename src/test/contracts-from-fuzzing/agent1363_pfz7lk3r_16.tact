struct AddressCellStruct {
    addr: Address;
    cell: Cell;
}

contract AddressCellStorage {
    data: AddressCellStruct;

    init() {
        self.data = AddressCellStruct{
            addr: myAddress(),
            cell: emptyCell(),
        };
    }
}