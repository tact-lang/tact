struct SliceHolder {
    cellData: Cell;
    sliceData: Slice;
    optionalSlice: Slice?;
}

contract CellSliceTest {
    myData: SliceHolder;

    init() {
        self.myData = SliceHolder{
            cellData: emptyCell(),
            sliceData: emptyCell().asSlice(),
            optionalSlice: null,
        };
    }
}