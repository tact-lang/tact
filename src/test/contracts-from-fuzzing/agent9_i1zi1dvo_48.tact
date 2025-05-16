struct OuterOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract NestedOptionalsWeird {
    test: OuterOpt;
    init() {
        self.test = OuterOpt { nested: null };
    }
}