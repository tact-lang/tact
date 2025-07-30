struct OptSliceCell {
    s: Slice?;
    c: Cell?;
}

contract SliceCellOpt {
    val: OptSliceCell;

    init() {
        self.val = OptSliceCell{
            s: null,
            c: null
        };
    }
}