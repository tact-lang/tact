struct SBytes {
    s: Slice;
    c: Cell;
}

contract PersistSlicesAndCells {
    dat: SBytes;

    init() {
        self.dat = SBytes{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}