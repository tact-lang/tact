struct CellSliceOpt {
    cell: Cell?;
    slice: Slice?;
}

contract CellSliceOptionalHolder {
    data: CellSliceOpt;

    init() {
        self.data = CellSliceOpt{
            cell: null,
            slice: null,
        };
    }
}