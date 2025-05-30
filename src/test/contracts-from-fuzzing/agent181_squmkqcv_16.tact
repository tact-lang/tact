struct InnerMost {
    x: Int;
    y: Bool?;
}

struct MiddleLayer {
    m1: InnerMost;
    m2: InnerMost?;
}

struct OuterLayer {
    big: MiddleLayer;
}

contract MultiLayerOptional {
    data: OuterLayer;

    init() {
        self.data = OuterLayer{
            big: MiddleLayer{
                m1: InnerMost{ x:1, y:true },
                m2: null
            }
        };
    }
}
