struct NestedOptionals {
    x: Int?;
    y: String?;
}

struct Container {
    nested: NestedOptionals?;
}

contract OptionalNest {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedOptionals{
                x: null,
                y: "hi",
            },
        };
    }
}
