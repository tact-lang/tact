contract ForbiddenBuilderStorage {
    builder: Builder;

    init() {
        self.builder = beginCell();
    }
}