struct Basic {
    i: Int;
}

struct MiddleOpt {
    x: Basic?;
    y: Int?;
}

contract NestedOptionalsDeep {
    s: MiddleOpt;

    init() {
        self.s = MiddleOpt{ x: null, y: null };
    }
}