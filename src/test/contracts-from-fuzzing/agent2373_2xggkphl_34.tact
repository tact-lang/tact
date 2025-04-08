contract OptionalSliceField {
    data: Slice?;
    init() {
        self.data = null;
    }
}