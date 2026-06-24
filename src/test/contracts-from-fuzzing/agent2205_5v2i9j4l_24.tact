struct HasBuilder {
    data: Builder;
}

contract BuilderStore {
    s: HasBuilder;

    init() {
        self.s = HasBuilder{ data: beginCell() };
    }
}