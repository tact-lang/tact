struct OuterMostOpt {
    middle: MiddleOpt?;
}

struct MiddleOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    a: Int;
}

contract DeepNestedOpts {
    val: OuterMostOpt;

    init() {
        self.val = OuterMostOpt{
            middle: null
        };
    }
}