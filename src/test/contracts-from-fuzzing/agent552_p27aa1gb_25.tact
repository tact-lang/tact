struct SliceWrapper {
    sl: Slice;
}

struct CellWrapper {
    cell: Cell;
}

struct Both {
    s: SliceWrapper;
    c: CellWrapper;
}

contract TestContract {
    w: Both;

    init() {
        self.w = Both{
            s: SliceWrapper{ sl: emptyCell().asSlice() },
            c: CellWrapper{ cell: emptyCell() }
        };
    }
}