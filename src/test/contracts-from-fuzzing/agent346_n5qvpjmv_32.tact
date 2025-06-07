struct ContainsBuilder {
    b: Builder;
    optB: Builder?;
}

contract BuilderFields {
    data: ContainsBuilder;
    init() {
        self.data = ContainsBuilder{
            b: beginCell(),
            optB: null
        };
    }
}