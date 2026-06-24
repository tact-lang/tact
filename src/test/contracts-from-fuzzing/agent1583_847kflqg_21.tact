struct InnerMost {
    foo: Int;
    bar: String;
}

struct Mid {
    in1: InnerMost;
    in2: InnerMost;
}

struct OuterMost {
    mid1: Mid;
    mid2: Mid;
}

contract DeepTree {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid1: Mid{
                in1: InnerMost{foo:1, bar:"a"},
                in2: InnerMost{foo:2, bar:"b"}
            },
            mid2: Mid{
                in1: InnerMost{foo:3, bar:"c"},
                in2: InnerMost{foo:4, bar:"d"}
            }
        };
    }
}