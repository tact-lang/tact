struct OptInner {
    x: Int?;
}

struct ComposeOpt {
    a: OptInner?;
    b: Int;
}

contract NullableNestedStruct {
    storage: ComposeOpt;

    init() {
        self.storage = ComposeOpt{
            a: null,
            b: 99
        };
    }
}
