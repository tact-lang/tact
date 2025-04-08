struct References {
    cellField: Cell;
    sliceField: Slice;
}

contract TestContract {
    data: References;

    init() {
        self.data = References{
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice()
        };
    }
}