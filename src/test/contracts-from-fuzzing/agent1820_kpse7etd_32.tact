struct CellVariants {
    c: Cell;
    cslice: Slice;
    copt: Cell?;
    sopt: Slice?;
}

contract TestContract {
    x: CellVariants;
    init() {
        self.x = CellVariants{
            c: emptyCell(),
            cslice: emptyCell().asSlice(),
            copt: null,
            sopt: null,
        };
    }
}