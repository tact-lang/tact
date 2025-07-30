struct NestedSlicesCells {
    s1: Slice;
    s2: Slice;
    c1: Cell;
    c2: Cell;
}

contract TestContract {
    nested: NestedSlicesCells;

    init() {
        self.nested = NestedSlicesCells{
            s1: emptyCell().asSlice(),
            s2: emptyCell().asSlice(),
            c1: emptyCell(),
            c2: emptyCell(),
        };
    }
}