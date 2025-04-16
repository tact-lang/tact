struct InnerLayer {
    val: Int;
}

struct MiddleLayer {
    opt: InnerLayer?;
}

struct TopLayer {
    m: MiddleLayer;
}

contract OptionalNestedStruct {
    s: TopLayer;

    init() {
        self.s = TopLayer{
            m: MiddleLayer{
                opt: null
            }
        };
    }
}