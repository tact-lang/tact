contract StructWithSliceAndBuilder {
    s: Slice;
    b: Builder;

    init() {
        let c = emptyCell();
        self.s = c.asSlice();
        self.b = beginCell();
    }
}
