struct CellStuff {
    cell: Cell;
    slice: Slice;
    builder: Builder;
}

contract CellHolder {
    stuff: CellStuff;

    init() {
        self.stuff = CellStuff{
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            builder: beginCell()
        };
    }
}