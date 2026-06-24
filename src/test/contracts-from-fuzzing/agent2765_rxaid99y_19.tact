struct InnerMost {
    x: Int;
}

struct MiddleNest {
    inn: InnerMost;
}

struct TopNest {
    mid: MiddleNest;
}

contract TinyDeep {
    deep: TopNest;

    init() {
        self.deep = TopNest{
            mid: MiddleNest{
                inn: InnerMost{x:7}
            }
        };
    }
}