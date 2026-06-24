struct OneOptional {
    data: Int?;
}

struct ContainerOptional {
    nested: OneOptional?;
}

struct TopOptional {
    nestedContainer: ContainerOptional?;
}

contract NestedOptionalFields {
    field: TopOptional;

    init() {
        self.field = TopOptional{};
    }
}