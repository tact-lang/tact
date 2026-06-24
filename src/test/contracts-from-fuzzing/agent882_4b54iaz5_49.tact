contract OptionalBuilderCell {
    b: Builder?;
    c: Cell?;

    init() {
        self.b = null;
        self.c = null;
    }
}