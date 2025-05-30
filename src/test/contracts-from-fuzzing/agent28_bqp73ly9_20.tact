struct InnerOpt {
    value: Int?;
}

struct InnerNoneOpt {
    innerOpt: InnerOpt?;
}

contract NestedOptionalFields {
    s: InnerNoneOpt;

    init() {
        self.s = InnerNoneOpt{
            innerOpt: null
        };
    }
}