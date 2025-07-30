struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct OuterMost {
    middle: Middle?;
}

contract NestedOptionals {
    nestedOpt: OuterMost;

    init() {
        self.nestedOpt = OuterMost{
            middle: null
        };
    }
}
