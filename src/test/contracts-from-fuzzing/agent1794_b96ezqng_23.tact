struct OptionalSliceBuilder {
    s: Slice?;
    b: Builder?;
}

contract SliceBuilderOpt {
    st: OptionalSliceBuilder;

    init() {
        self.st = OptionalSliceBuilder {
            s: emptyCell().asSlice(),
            b: beginCell(),
        };
    }
}