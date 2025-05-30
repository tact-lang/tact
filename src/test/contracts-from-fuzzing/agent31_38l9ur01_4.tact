struct DeepOpt {
    nested: NestedOpt?;
}

struct NestedOpt {
    d: Int?;
    s: String?;
}

contract TestContract {
    data: DeepOpt;

    init() {
        self.data = DeepOpt{
            nested: NestedOpt{
                d: null,
                s: null,
            },
        };
    }
}
