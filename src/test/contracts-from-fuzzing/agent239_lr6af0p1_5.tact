struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    x: InnerOpt?;
    y: Int;
}

contract NestedOptionalsContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{ x: null, y: 42 };
    }
}