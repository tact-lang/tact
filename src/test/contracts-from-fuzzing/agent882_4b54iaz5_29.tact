struct ContainsBuilder {
    b: Builder;
}

contract Container {
    field: ContainsBuilder;

    init() {
        self.field = ContainsBuilder{ b: beginCell() };
    }
}