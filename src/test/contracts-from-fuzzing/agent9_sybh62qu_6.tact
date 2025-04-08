struct MultiDepthOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int;
}

struct OuterOpt {
    aa: MultiDepthOpt?;
    bb: MultiDepthOpt?;
}

contract NestedOptionalsCombo {
    data: OuterOpt;
    
    init() {
        self.data = OuterOpt{
            aa: MultiDepthOpt{
                a: 1, b: null, c: "hi", d: 2
            },
            bb: null,
        };
    }
}