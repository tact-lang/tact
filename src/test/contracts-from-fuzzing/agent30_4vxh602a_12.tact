struct WithSliceAndCell {
    s: Slice;
    c: Cell;
}

contract PersistSlicesCells {
    data: WithSliceAndCell;

    init() {
        self.data = WithSliceAndCell{
            s: "hello".asComment().asSlice(),
            c: "world".asComment()
        };
    }
}