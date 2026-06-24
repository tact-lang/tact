struct SBoolOpt {
    x: Bool?;
}

struct TwoOptWrap {
    w1: SBoolOpt?;
    w2: SBoolOpt?;
}

contract NestedOptionLayers {
    val: TwoOptWrap;

    init() {
        self.val = TwoOptWrap{
            w1: SBoolOpt{ x:true },
            w2: null,
        };
    }
}
