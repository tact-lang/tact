struct OptInOpt {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract NestedOptionals {
    f: OptInOpt?;

    init() {
        self.f = OptInOpt{
            innerOpt: InnerOpt{
                val: null,
            },
        };
    }
}