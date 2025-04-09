struct SliceCellCombo {
    sl: Slice;
    cl: Cell;
    osl: Slice?;
    ocl: Cell?;
}

contract SliceCellStorage {
    data: SliceCellCombo;

    init() {
        self.data = SliceCellCombo{
            sl: emptyCell().asSlice(),
            cl: emptyCell(),
            osl: null,
            ocl: null
        };
    }
}