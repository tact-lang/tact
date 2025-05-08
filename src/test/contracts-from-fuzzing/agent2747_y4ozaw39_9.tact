struct NestedOptional {
    optInner: Int?;
}

struct ContainerOptional {
    nested: NestedOptional?;
}

contract OptionalNestedField {
    field: ContainerOptional;

    init() {
        self.field = ContainerOptional{
            nested: NestedOptional{optInner: 5}
        };
    }
}