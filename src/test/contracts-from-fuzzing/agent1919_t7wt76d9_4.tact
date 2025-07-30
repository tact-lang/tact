struct InnerMost {
    val1: Int;
    val2: String?;
}

struct InnerLayer {
    nested1: InnerMost;
    nested2: InnerMost;
}

struct OuterLayer {
    inLayer: InnerLayer;
    moreData: String;
}

contract TestContract {
    out: OuterLayer;
    init() {
        self.out = OuterLayer{
            inLayer: InnerLayer{
                nested1: InnerMost{val1:1, val2:null},
                nested2: InnerMost{val1:2, val2:"hi"}
            },
            moreData: "something"
        };
    }
}