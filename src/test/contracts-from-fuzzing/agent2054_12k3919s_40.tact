struct WithBuilder {
    b: Builder;
}

contract BuilderPersist {
    data: WithBuilder;
    init() {
        self.data = WithBuilder{ b: beginCell() };
    }
}