struct Base {
    foo: Int;
}

struct Container {
    nested: Base;
    nestedOpt: Base?;
}

contract NullableNested2 {
    x: Container;

    init() {
        self.x = Container{
            nested: Base{ foo: 1 },
            nestedOpt: null
        };
    }
}