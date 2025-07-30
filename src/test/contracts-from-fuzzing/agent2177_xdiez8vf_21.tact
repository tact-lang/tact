struct NestedSliceCell {
    x: Int;
    s: Slice?;
    c: Cell?;
}

contract OptSliceCellStorage {
    nested: NestedSliceCell;

    init() {
        self.nested = NestedSliceCell{
            x: 10,
            s: null,
            c: emptyCell()
        };
    }
}