struct Inner {
    x: Int;
}

struct MiddleOpt {
    innerOpt: Inner?;
}

contract Test {
    maybeNested: MiddleOpt;

    init() {
        self.maybeNested = MiddleOpt{
            innerOpt: null
        };
    }
}
