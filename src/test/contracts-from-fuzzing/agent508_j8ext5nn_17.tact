struct Wrap {
    cellA: Cell;
    sliceB: Slice;
    strC: String;
}

contract Combined {
    field: Wrap;

    init() {
        self.field = Wrap{
            cellA: emptyCell(),
            sliceB: emptyCell().asSlice(),
            strC: "Hello"
        };
    }
}