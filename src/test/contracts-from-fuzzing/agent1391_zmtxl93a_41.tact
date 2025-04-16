contract OptionalSlice {
    data: Slice?;

    init() {
        self.data = null;
    }
}