struct Wrapper {
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
}

contract CompositeCells {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
        };
    }
}