struct HasCellSliceAddr {
    cell: Cell;
    slice: Slice;
    addr: Address;
    oCell: Cell?;
    oSlice: Slice?;
    oAddr: Address?;
}

contract CellSliceAddrTest {
    data: HasCellSliceAddr;
    init() {
        self.data = HasCellSliceAddr{
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            addr: myAddress(),
            oCell: null,
            oSlice: null,
            oAddr: null,
        };
    }
}