contract OptionalBuilderSlice {
    builderOpt: Builder?;
    sliceOpt: Slice?;

    init() {
        self.builderOpt = null;
        self.sliceOpt = null;
    }
}