struct MultiNesting {
    d1: Int;
    d2: Bool;
    d3: String;
}

struct MoreLayer {
    p1: MultiNesting;
    p2: MultiNesting;
}

struct TopLayer {
    l1: MoreLayer;
    l2: MoreLayer;
}

contract MultiLayerFields {
    value: TopLayer;
    init() {
        self.value = TopLayer{
            l1: MoreLayer{
                p1: MultiNesting{d1:1,d2:true,d3:"aa"},
                p2: MultiNesting{d1:2,d2:false,d3:"bb"}
            },
            l2: MoreLayer{
                p1: MultiNesting{d1:3,d2:true,d3:"cc"},
                p2: MultiNesting{d1:4,d2:false,d3:"dd"}
            }
        };
    }
}