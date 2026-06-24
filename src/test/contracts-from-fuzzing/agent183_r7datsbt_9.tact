struct WithOptionalStruct {
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    y: Int;
    name: String;
}

contract OptionalNestedStruct {
    state: WithOptionalStruct = WithOptionalStruct{
        nestedOpt: null,
    };

    init() {
        self.state = WithOptionalStruct{
            nestedOpt: InnerStruct{ y: 7, name: "hello" },
        };
    }
}