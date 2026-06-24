contract TestBuilderStorage {
    b: Builder;

    init() {
        self.b = beginCell();
    }
}