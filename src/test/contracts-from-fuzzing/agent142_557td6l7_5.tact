struct NestedOptionals {
    x: Int?;
    y: Bool?;
}

struct Container {
    nested: NestedOptionals?;
}

contract TestOpt {
    field: Container;

    init() {
        self.field = Container{
            nested: NestedOptionals{ x: 5, y: null }
        };
    }
}
