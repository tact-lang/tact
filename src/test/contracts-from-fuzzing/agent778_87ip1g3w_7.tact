struct NestedOptional {
    innerOpt: Int?;
    flag: Bool;
}

struct ContainsOptional {
    maybeInner: NestedOptional?;
    other: Int;
}

contract OptionalInOptional {
    data: ContainsOptional;
    init() {
        self.data = ContainsOptional{
            maybeInner: null,
            other: 77
        };
    }
}