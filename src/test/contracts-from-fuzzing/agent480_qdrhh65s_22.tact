contract OptionalSlicesBuilders {
    sliceOpt: Slice?;
    builderOpt: Builder?;

    init() {
        self.sliceOpt = emptyCell().asSlice();
        self.builderOpt = null;
    }
}