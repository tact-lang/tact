struct DeepOpt {
    val: Int;
}

struct OuterOpt {
    nested: DeepOpt?;
    other: Int;
}

contract OptionalNestedStruct {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            nested: null,
            other: 777
        };
    }
}