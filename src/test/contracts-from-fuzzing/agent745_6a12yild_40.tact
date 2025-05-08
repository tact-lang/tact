struct CellNested {
    c: Cell;
}

struct SliceNested {
    s: Slice;
}

struct Comb {
    cellField: CellNested;
    sliceField: SliceNested;
}

contract CellSliceStructs {
    testVal: Comb;

    init() {
        self.testVal = Comb{
            cellField: CellNested{ c: emptyCell() },
            sliceField: SliceNested{ s: emptyCell().asSlice() }
        };
    }
}