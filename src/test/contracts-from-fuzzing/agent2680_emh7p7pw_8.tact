struct HasSliceBuilder {
    s: Slice;
    b: Builder;
}

contract SliceBuilderStore {
    info: HasSliceBuilder;

    init() {
        self.info = HasSliceBuilder{
            s: emptyCell().asSlice(),
            b: beginCell()
        };
    }
}