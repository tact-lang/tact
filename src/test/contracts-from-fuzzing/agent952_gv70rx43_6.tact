struct NestedOptional {
    f1: Int?;
    f2: Bool?;
}

struct WrapNestedOpt {
    s1: NestedOptional?;
}

contract Test {
    field: WrapNestedOpt;

    init() {
        self.field = WrapNestedOpt{
            s1: NestedOptional{
                f1: null,
                f2: true,
            },
        };
    }
}
