struct OptionalNest {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    value: Int;
    strVal: String?;
}

contract OptionalTest {
    nested: OptionalNest;
    init() {
        self.nested = OptionalNest{
            innerOpt: InnerOpt{
                value: 42,
                strVal: null
            }
        };
    }
}