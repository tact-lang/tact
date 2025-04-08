struct InnerMost {
    k: Int?;
}

struct InnerOpt {
    j: Bool?;
    innermost: InnerMost?;
}

struct MiddleOpt {
    i: String?;
    inner: InnerOpt?;
}

contract NestedOptionals {
    data: MiddleOpt;
    init() {
        self.data = MiddleOpt{
            i: null,
            inner: null,
        };
    }
}