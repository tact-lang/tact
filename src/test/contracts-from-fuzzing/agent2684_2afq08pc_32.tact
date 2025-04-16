struct NestedSlice {
    s: Slice;
}

contract SliceContainer {
    field: NestedSlice;

    init() {
        self.field = NestedSlice { s: emptyCell().asSlice() };
    }
}
