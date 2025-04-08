struct SliceCellTest {
    dataSlice: Slice;
    dataCell: Cell;
}

contract CellSliceFields {
    store: SliceCellTest;

    init() {
        let cl = beginCell().storeUint(123, 8).endCell();
        self.store = SliceCellTest{
            dataSlice: cl.asSlice(),
            dataCell: cl
        };
    }
}
