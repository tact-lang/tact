struct InnerMost {
    x: Int;
}

struct Mid {
    y: InnerMost;
}

struct OuterWrap {
    z: Mid;
}

contract DeepWrap {
    data: OuterWrap;
    init() {
        self.data = OuterWrap{z: Mid{y:InnerMost{x:5}}};
    }
}