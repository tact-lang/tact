struct CellStruct {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract CellStructStore {
    data: CellStruct;

    init() {
        self.data = CellStruct{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}