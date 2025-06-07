struct InnerMost {
    a: Int;
}

struct Inner {
    one: Int;
    two: Int;
    innerMost: InnerMost;
}

contract TinyTree {
    node1: Inner;
    node2: Inner;

    init() {
        self.node1 = Inner{one:1,two:2,innerMost:InnerMost{a:3}};
        self.node2 = Inner{one:4,two:5,innerMost:InnerMost{a:6}};
    }
}