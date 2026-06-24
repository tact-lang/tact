contract PersistentBuilderContract {
    build: Builder;

    init() {
        self.build = beginCell();
    }
}