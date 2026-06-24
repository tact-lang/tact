struct DoubleNestedOpt {
    innerOpt: Inner?;
}

struct Inner {
    v: Int;
    s: String?;
}

contract NestedOptionalFields {
    x: DoubleNestedOpt;

    init() {
        self.x = DoubleNestedOpt{
            innerOpt: Inner{
                v: 42,
                s: null
            }
        };
    }
}
