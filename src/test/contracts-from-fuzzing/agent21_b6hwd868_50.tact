struct ContainsBuilder {
    b: Builder;
    optB: Builder?;
}

contract BuilderHolder {
    f: ContainsBuilder;

    init() {
        self.f = ContainsBuilder{
            b: beginCell(),
            optB: null
        };
    }
}