struct WithBuilder {
    b: Builder;
}

contract BuilderInStruct {
    data: WithBuilder;

    init() {
        self.data = WithBuilder{b: beginCell()};
    }
}