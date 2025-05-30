struct EmbedSliceBuilder {
    c: Cell;
    sl: Slice;
    bld: Builder;
}

contract PrimitivesTest {
    data: EmbedSliceBuilder;

    init() {
        self.data = EmbedSliceBuilder{
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bld: beginCell()
        };
    }
}
