struct OptionalNest {
    s: Int?;
    t: Bool?;
    n: NestedOpt?;
}

struct NestedOpt {
    x: Int;
    y: String?;
}

contract TestContract {
    optNest: OptionalNest;

    init() {
        self.optNest = OptionalNest{
            s: null,
            t: true,
            n: NestedOpt{ x: 100, y: null }
        };
    }
}