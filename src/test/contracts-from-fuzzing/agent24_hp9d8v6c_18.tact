struct SDeepOpt {
    nested: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
    flag: Bool;
}

contract NestedOptTop {
    s: SDeepOpt;

    init() {
        self.s = SDeepOpt{
            nested: InnerOpt{
                val: null,
                flag: true,
            },
        };
    }
}