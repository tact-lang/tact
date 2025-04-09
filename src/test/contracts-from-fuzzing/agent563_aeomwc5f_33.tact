struct HasBuilder {
    b: Builder?;
}

contract BuilderField {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{ b: null };
    }
}