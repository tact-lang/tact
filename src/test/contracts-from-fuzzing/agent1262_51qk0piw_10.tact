struct InnerMost {
    val: Int;
}

struct MiddleLayer {
    nested: InnerMost?;
}

struct OuterLayer {
    mid: MiddleLayer;
}

contract OptionInsideStructNested {
    state: OuterLayer = OuterLayer{
        mid: MiddleLayer{
            nested: null
        }
    };
}