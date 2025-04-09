struct WithSliceAndCell {
    cellVal: Cell;
    sliceVal: Slice;
}

contract TestSliceCell {
    mydata: WithSliceAndCell;

    init() {
        self.mydata = WithSliceAndCell{
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice()
        };
    }
}
