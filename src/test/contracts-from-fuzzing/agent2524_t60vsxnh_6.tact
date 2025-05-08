struct InnerMost {
    val: Int?;
}

struct InnerLayer {
    inner: InnerMost?;
}

struct OuterLayer {
    middle: InnerLayer?;
}

contract DeepNest {
    nested: OuterLayer = OuterLayer{
        middle: null
    };
}