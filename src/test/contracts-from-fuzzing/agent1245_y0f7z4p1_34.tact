struct NestedOptionalLevel {
    innerOpt: Int?;
}

struct ContainerWithOptional {
    nested: NestedOptionalLevel?;
}

contract OptionalInsideOptional {
    data: ContainerWithOptional;

    init() {
        self.data = ContainerWithOptional {
            nested: null,
        };
    }
}
