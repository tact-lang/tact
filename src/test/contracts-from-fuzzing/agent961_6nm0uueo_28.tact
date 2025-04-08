contract OptionalPersistentSlice {
    data: Slice?;

    init() {
        self.data = null;
    }
}