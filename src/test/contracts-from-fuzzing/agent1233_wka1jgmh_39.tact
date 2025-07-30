// Struct with optional cell and slice
struct CellishOptional {
    c: Cell?;
    s: Slice?;
}

contract OptCellSlicePersist {
    state: CellishOptional;

    init() {
        self.state = CellishOptional{c:null,s:null};
    }
}