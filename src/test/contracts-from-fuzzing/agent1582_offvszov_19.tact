struct WrappedInner {
    val: Int;
}

struct MiddleLayer {
    wrapped: WrappedInner?;
}

struct TopLayer {
    middle: MiddleLayer?;
}

contract MultiLayerOptionals {
    layer: TopLayer = TopLayer{
        middle: null,
    };

    receive() {}
}