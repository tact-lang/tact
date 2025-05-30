contract OptionalBuilderFields {
    b1: Builder?;
    b2: Builder?;
    init() {
        self.b1 = null;
        self.b2 = null;
    }
}