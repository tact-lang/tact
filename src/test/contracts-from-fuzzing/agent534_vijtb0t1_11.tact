struct OptionalOuter {
    innerOpt: InnerTwo?;
}

struct InnerTwo {
    c: Bool;
    d: Int?;
}

contract OptNested {
    outer: OptionalOuter;

    init() {
        self.outer = OptionalOuter{
            innerOpt: null,
        };
    }
}