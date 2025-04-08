struct InnerMost {
    x: Int;
    y: Bool;
}

struct MiddleLayer {
    inner: InnerMost;
    optInner: InnerMost?;
}

struct OuterLayer {
    m1: MiddleLayer;
    m2: MiddleLayer;
    optM: MiddleLayer?;
}

contract DeepComposite {
    val: OuterLayer;

    init() {
        self.val = OuterLayer{
            m1: MiddleLayer{
                inner: InnerMost{ x:1,y:true },
                optInner: null,
            },
            m2: MiddleLayer{
                inner: InnerMost{ x:2,y:false },
                optInner: null,
            },
            optM: null,
        };
    }
}
