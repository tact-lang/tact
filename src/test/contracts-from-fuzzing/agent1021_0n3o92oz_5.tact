struct NestedOptional {
    innerOpt: Int?;
}

struct Container {
    nested: NestedOptional?;
}

contract OptionalInOptional {
    data: Container;

    init() {
        self.data = Container{};
    }
}