struct OptOnly {
    a: Int?;
    b: Bool?;
}

struct WrapOpt {
    nested: OptOnly;
}

contract NestedOptionalsField {
    data: WrapOpt;

    init() {
        self.data = WrapOpt {
            nested: OptOnly { a: null, b: null }
        };
    }
}