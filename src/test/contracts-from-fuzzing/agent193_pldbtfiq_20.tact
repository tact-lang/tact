struct HasBuilder {
    b: Builder;
}

contract BuilderField {
    val: HasBuilder;

    init() {
        self.val = HasBuilder{b: beginCell()};
    }
}