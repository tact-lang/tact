struct NestedOpt {
    inner: Int?;
}

struct Top {
    innerOpt: NestedOpt?;
}

contract OptionalNesting {
    val: Top;

    init() {
        self.val = Top{
            innerOpt: null
        };
    }
}