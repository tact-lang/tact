struct StructWithCellOpt {
    c: Cell?;
    s: Slice?;
}

contract CellAndSliceOptionals {
    ss: StructWithCellOpt;

    init() {
        self.ss = StructWithCellOpt{c: null, s: null};
    }
}
