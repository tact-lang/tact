struct NestedSliceCell {
    sl: Slice;
    cl: Cell;
    st: String;
}

contract NestedPrimitives {
    f: NestedSliceCell;
    init() {
        self.f = NestedSliceCell{sl: emptyCell().asSlice(), cl: emptyCell(), st: "abc"};
    }
    receive() {}
}