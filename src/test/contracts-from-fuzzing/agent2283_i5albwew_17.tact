struct DeepOptional {
    inner: Int?;
}

struct Wrapper {
    nested: DeepOptional?;
}

contract NestedOptionalsDefaults {
    s: Wrapper = Wrapper{nested: null};

    init() {
        self.s = Wrapper{nested: null};
    }
}
