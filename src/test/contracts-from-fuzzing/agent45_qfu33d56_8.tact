struct DeepOptional {
    inner: Int?;
}

struct OuterOptional {
    nested: DeepOptional?;
}

contract NestedOptionChains {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{ nested: null };
    }
}