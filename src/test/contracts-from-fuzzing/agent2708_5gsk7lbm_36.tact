contract OptionalBuilderSlice {
    b: Builder?;
    s: Slice?;

    init() {
        self.b = null;
        self.s = null;
    }
}