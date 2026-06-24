struct InnerOne {
    foo: Int;
}

struct InnerTwo {
    bar: Bool;
}

struct Container {
    first: InnerOne?;
    second: InnerTwo?;
}

contract DoubleOptionalNested {
    nested: Container;

    init() {
        self.nested = Container{
            first: null,
            second: null
        };
    }
}