struct DeeplyNested {
    val: Int;
}

struct MiddleLayer {
    nested: DeeplyNested;
}

struct TopLayer {
    middle: MiddleLayer;
}

contract DeepNest {
    top: TopLayer;
    init() {
        self.top = TopLayer{ middle: MiddleLayer{ nested: DeeplyNested{ val: 99 } } };
    }
}