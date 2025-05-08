contract BuilderPersistBug {
    b: Builder;

    init() {
        self.b = beginCell();
    }
}