struct DeepOption {
    value: Int?;
}

struct WithDeepOption {
    deep: DeepOption;
    text: String;
}

contract CompositeOpts {
    field: WithDeepOption;

    init() {
        self.field = WithDeepOption{
            deep: DeepOption{value: null},
            text: "testing",
        };
    }
}