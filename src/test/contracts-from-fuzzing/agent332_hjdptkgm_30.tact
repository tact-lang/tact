struct HasBuilder {
    b: Builder;
    i: Int;
}

contract BuilderField {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{
            b: beginCell(),
            i: 5
        };
    }
}