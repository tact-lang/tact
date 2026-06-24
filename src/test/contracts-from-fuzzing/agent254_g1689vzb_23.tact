struct SLWrap {
    sliceVal: Slice;
    cellVal: Cell;
    builderVal: Builder;
}

contract SliceCellBuilderTest {
    data: SLWrap;

    init() {
        self.data = SLWrap{
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            builderVal: beginCell()
        };
    }
}