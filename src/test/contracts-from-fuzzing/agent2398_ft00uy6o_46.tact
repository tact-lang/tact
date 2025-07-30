contract OptionalBuilderField {
    payload: Builder?;

    init() {
        self.payload = null;
    }
}