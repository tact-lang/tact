struct CellSliceStruct {
    dataCell: Cell;
    dataSlice: Slice;
}

contract PrimitivesStructTest {
    s: CellSliceStruct;

    init() {
        self.s = CellSliceStruct{
            dataCell: emptyCell(),
            dataSlice: emptyCell().asSlice()
        };
    }
}