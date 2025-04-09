struct DeepNestedOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    sub: SubInnerOpt?;
}

struct SubInnerOpt {
    value: Int?;
}

contract NestedOptionals {
    state: DeepNestedOpt;

    init() {
        self.state = DeepNestedOpt{
            inner: null
        };
    }
}