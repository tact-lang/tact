struct CellSlice {
    c: Cell;
    s: Slice;
    co: Cell?;
    so: Slice?;
}

contract TestContract {
    field: CellSlice;
    
    init() {
        let empty = emptyCell();
        self.field = CellSlice {
            c: empty,
            s: empty.asSlice(),
            co: null,
            so: null
        };
    }
}