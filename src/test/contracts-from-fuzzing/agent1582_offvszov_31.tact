struct InnerLayer {
    value: Int;
}

struct MiddleLayer {
    inner: InnerLayer?;
}

struct OuterLayer {
    middle: MiddleLayer?;
}

contract OptionalNestedLayers {
    data: OuterLayer = OuterLayer {
        middle: null
    };
    receive() {}
}