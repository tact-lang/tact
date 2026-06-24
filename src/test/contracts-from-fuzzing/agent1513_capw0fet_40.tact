struct CellAndSlice {
    c: Cell;
    s: Slice;
}

contract CellSlice {
    x: CellAndSlice;
    
    init() {
        self.x = CellAndSlice{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
    }
}