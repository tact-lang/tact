contract OptionalSliceAndBuilder {
    s: Slice?;
    b: Builder?;

    init() {
        self.s = null;
        self.b = null;
    }
}
