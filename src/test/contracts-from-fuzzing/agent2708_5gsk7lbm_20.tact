struct WithSliceBuilder {
    s: Slice;
    b: Builder;
}

contract SliceBuildStore {
    data: WithSliceBuilder;

    init() {
        self.data = WithSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}