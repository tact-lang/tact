struct WithBuilder {
    b: Builder;
    s: String;
}

contract BuilderStruct {
    data: WithBuilder;

    init() {
        self.data = WithBuilder{
            b: beginCell(),
            s: "builder"
        };
    }
}