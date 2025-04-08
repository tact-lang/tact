struct WithBuilder {
    b: Builder;
    info: String;
}

contract BuilderStruct {
    val: WithBuilder;

    init() {
        self.val = WithBuilder{
            b: beginCell(),
            info: "builder"
        };
    }
}