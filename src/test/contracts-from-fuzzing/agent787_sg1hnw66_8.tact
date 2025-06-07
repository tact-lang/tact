contract TestContract {
    builderField: Builder;

    init() {
        self.builderField = beginCell();
    }
}