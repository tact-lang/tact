struct NestedOptional {
    innerOpt: Bool?;
}

struct TopLevel {
    nested: NestedOptional?;
}

contract TestContract {
    field: TopLevel;

    init() {
        self.field = TopLevel{
            nested: null,
        };
    }
}