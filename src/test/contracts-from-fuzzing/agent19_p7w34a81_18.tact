struct OptionalWrapper {
    val: Int?;
}

struct NestedLayer {
    wrapper: OptionalWrapper;
}

struct TopLayer {
    nested: NestedLayer;
    message: String;
}

contract OptionalInChain {
    top: TopLayer;

    init() {
        self.top = TopLayer{
            nested: NestedLayer{
                wrapper: OptionalWrapper{ val: null },
            },
            message: "msg",
        };
    }
}