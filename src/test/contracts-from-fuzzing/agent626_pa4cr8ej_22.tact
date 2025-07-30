struct HasSliceBuilder {
    s: Slice;
    b: Builder;
}

contract SliceBuilderStore {
    f: HasSliceBuilder;

    init() {
        self.f = HasSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}