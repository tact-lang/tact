struct CellStruct {
    c1: Cell;
    c2: Cell?;
    s1: Slice;
    s2: Slice?;
}

contract TestContract {
    data: CellStruct;
    init() {
        self.data = CellStruct{
            c1: emptyCell(),
            c2: null,
            s1: emptyCell().asSlice(),
            s2: null
        };
    }
}
