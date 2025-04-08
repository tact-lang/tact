struct NestedWithOptionalPrimitives {
    x: Int?;
    y: Bool?;
}

struct Container {
    nested: NestedWithOptionalPrimitives;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nested: NestedWithOptionalPrimitives{
                x: null,
                y: null,
            },
            flag: true,
        };
    }
}