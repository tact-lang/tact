struct HasBuilder {
    value: Builder;
}

contract BuilderInState {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{
            value: beginCell()
        };
    }
}