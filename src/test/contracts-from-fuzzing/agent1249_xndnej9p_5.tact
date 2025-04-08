struct NestedOpt {
    innerOpt: Int?;
}

struct WithNestedOpt {
    nested: NestedOpt?;
}

contract OptionalStructField {
    data: WithNestedOpt;

    init() {
        self.data = WithNestedOpt{
            nested: null
        };
    }
}