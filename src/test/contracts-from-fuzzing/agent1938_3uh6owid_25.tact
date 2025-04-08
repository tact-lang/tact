struct NestedSlicesCell {
    a: Cell;
    b: Slice;
}

contract NestedSlicesCellTest {
    data: NestedSlicesCell;

    init() {
        self.data = NestedSlicesCell{ a: emptyCell(), b: emptyCell().asSlice() };
    }
}