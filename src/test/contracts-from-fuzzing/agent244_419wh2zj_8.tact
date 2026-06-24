struct Inner {
    value: Int;
}

struct Outer {
    nestedOptional: Inner?;
}

contract NullNestedOpt {
    data: Outer;

    init() {
        self.data = Outer{
            nestedOptional: null,
        };
    }
}