struct HasSlices {
    cell: Cell;
    slice: Slice;
}

contract SliceStore {
    data: HasSlices;

    init() {
        self.data = HasSlices{cell: emptyCell(), slice: emptyCell().asSlice()};
    }
}
