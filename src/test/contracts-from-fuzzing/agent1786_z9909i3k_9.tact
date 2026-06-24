struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Container {
    nested: NestedOptional?;
}

contract OptionalInsideOptional {
    data: Container;

    init() {
        self.data = Container {
            nested: null
        };
    }
}