struct WithBuilder {
    b: Builder;
    txt: String;
}

contract StructWithBuilder {
    x: WithBuilder;

    init() {
        self.x = WithBuilder{
            b: beginCell(),
            txt: "builder",
        };
    }
}