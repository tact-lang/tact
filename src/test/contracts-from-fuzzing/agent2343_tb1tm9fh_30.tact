struct HasSliceCellBuilder {
    s: Slice;
    c: Cell;
    b: Builder;
}

contract SliceCellBuilderTest {
    scb: HasSliceCellBuilder;

    init() {
        self.scb = HasSliceCellBuilder{
            s: emptyCell().asSlice(),
            c: emptyCell(),
            b: beginCell()
        };
    }
}
