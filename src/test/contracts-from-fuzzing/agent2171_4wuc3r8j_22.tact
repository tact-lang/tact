struct HasBuilder {
    b: Builder;
    bopt: Builder?;
}

contract BuilderFields {
    data: HasBuilder;

    init() {
        self.data = HasBuilder{
            b: beginCell(),
            bopt: null
        };
    }
}