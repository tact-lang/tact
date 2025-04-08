struct WithSliceBuilder {
    s: Slice;
    b: Builder;
}

contract SliceBuilderPersist {
    data: WithSliceBuilder;

    init() {
        self.data = WithSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}