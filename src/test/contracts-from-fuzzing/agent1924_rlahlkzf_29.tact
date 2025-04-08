struct CellSliceAddress {
    cell: Cell;
    slice: Slice;
    address: Address;
}

contract TestContract {
    data: CellSliceAddress;

    init() {
        self.data = CellSliceAddress{
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            address: myAddress()
        };
    }
}