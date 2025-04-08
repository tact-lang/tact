struct SliceNested {
    data: Slice;
    flag: Bool;
}

struct CellNested {
    blob: Cell;
    nested: SliceNested;
}

contract SliceCellTest {
    inner: CellNested;

    init() {
        self.inner = CellNested{ blob: emptyCell(), nested: SliceNested{data: emptyCell().asSlice(), flag: true} };
    }
}