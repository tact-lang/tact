struct Nested {
    f1: Int;
}

struct Container {
    nested1: Nested;
    nested2: Nested;
    nestedOpt: Nested?;
}

contract ManyNestedFields {
    cont: Container;

    init() {
        self.cont = Container{
            nested1: Nested{f1: 1},
            nested2: Nested{f1: 2},
            nestedOpt: null,
        };
    }
}
