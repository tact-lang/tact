struct DeepOpt {
    a: Int?;
}

struct NestedDeepOpt {
    inner: DeepOpt?;
}

struct OuterDeepOpt {
    nested: NestedDeepOpt?;
}

contract ChainNestedOptions {
    data: OuterDeepOpt;

    init() {
        self.data = OuterDeepOpt{
            nested: null
        };
    }
}