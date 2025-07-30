struct CellStruct {
    c: Cell;
    s: Slice;
    str: String;
}

contract AllCellTypes {
    f: CellStruct;

    init() {
        self.f = CellStruct{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "",
        };
    }
}