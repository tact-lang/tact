struct CellSlice {
    c: Cell;
    s: Slice;
}

struct OptionalCellSlice {
    c: Cell?;
    s: Slice?;
}

contract CellsSlicesCombos {
    a: CellSlice;
    b: OptionalCellSlice;

    init() {
        self.a = CellSlice{
            c: emptyCell(),
            s: emptyCell().asSlice()
        };
        self.b = OptionalCellSlice{
            c: null,
            s: null
        };
    }
}