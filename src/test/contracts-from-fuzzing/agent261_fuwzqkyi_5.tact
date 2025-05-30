struct InnerMost {
    x: Int;
    y: Bool;
}

struct Middle {
    nested1: InnerMost;
    nested2: InnerMost;
}

struct Top {
    mid1: Middle;
    mid2: Middle;
}

contract TestContract {
    bigNested: Top;
    init() {
        self.bigNested = Top{
            mid1: Middle{nested1: InnerMost{x:1,y:true}, nested2:InnerMost{x:2,y:false}},
            mid2: Middle{nested1: InnerMost{x:3,y:true}, nested2:InnerMost{x:4,y:false}}
        };
    }
}