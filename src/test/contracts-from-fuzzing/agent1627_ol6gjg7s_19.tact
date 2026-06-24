struct HasSliceAndBuilder {
    s: Slice;
    b: Builder;
    optS: Slice?;
    optB: Builder?;
}

contract SliceBuilderContainer {
    data: HasSliceAndBuilder;

    init() {
        self.data = HasSliceAndBuilder{
            s: emptyCell().asSlice(),
            b: beginCell(),
            optS: null,
            optB: null
        };
    }
}
