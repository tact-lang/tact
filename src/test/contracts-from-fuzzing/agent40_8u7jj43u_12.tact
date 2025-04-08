struct AddressCellSlice {
    addr: Address;
    cell: Cell;
    slice: Slice;
}

contract TestACS {
    data: AddressCellSlice;

    init() {
        self.data = AddressCellSlice{
            addr: myAddress(),
            cell: emptyCell(),
            slice: emptyCell().asSlice()
        };
    }

    receive() {
        let tmp = self.data;
    }
}