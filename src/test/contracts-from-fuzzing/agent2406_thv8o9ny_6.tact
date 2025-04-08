struct InnerOne {
    x: Int;
}

struct InnerTwo {
    y: Int;
}

struct MiddleLayer {
    o1: InnerOne;
    o2: InnerTwo;
}

struct TopStruct {
    m: MiddleLayer;
    extra: Int;
}

contract MultiLayerNested {
    top: TopStruct;

    init() {
        self.top = TopStruct{
            m: MiddleLayer{
                o1: InnerOne{ x: 1 },
                o2: InnerTwo{ y: 2 },
            },
            extra: 3
        };
    }
}