struct CellSliceBuilder {
    c: Cell;
    s: Slice;
    b: Builder;
}

contract CellSliceBuilderTest {
    data: CellSliceBuilder;

    init() {
        self.data = CellSliceBuilder{
            c: emptyCell(),
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}