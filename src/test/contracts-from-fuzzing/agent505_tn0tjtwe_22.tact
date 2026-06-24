contract BuilderPersistent {
    b: Builder;

    init() {
        self.b = beginCell();
    }
}
