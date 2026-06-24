struct NestedOpt {
    innerOpt: Int?;
    strVal: String?;
}

struct WithNestedOpt {
    nested: NestedOpt?;
    flag: Bool;
}

contract NestedOptionals {
    store: WithNestedOpt;

    init() {
        self.store = WithNestedOpt{
            nested: null,
            flag: true,
        };
    }
}
