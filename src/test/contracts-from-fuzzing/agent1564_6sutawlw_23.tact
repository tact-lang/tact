struct OuterLayer {
    mid: MiddleLayer;
}

struct MiddleLayer {
    inLayer: InnerLayer;
}

struct InnerLayer {
    val: Int;
    opt: Bool?;
}

contract ThreeLayerComposition {
    outer: OuterLayer;

    init() {
        self.outer = OuterLayer{ mid: MiddleLayer{ inLayer: InnerLayer{ val: 13, opt: null } } };
    }
}