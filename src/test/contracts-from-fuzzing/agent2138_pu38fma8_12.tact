struct NestedOptional {
    x: Int?;
    y: Bool;
}

struct MoreNestedOpt {
    inner: NestedOptional?;
    flag: Bool;
}

contract OptionalTop {
    nested: MoreNestedOpt?;

    init() {
        self.nested = MoreNestedOpt{
            inner: NestedOptional{
                x: null,
                y: true,
            },
            flag: false,
        };
    }
}