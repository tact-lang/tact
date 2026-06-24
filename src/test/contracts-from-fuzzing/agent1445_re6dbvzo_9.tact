struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner;
}

struct Container {
    outer: Outer;
}

contract NestedThreeLevels {
    data: Container;

    init() {
        self.data = Container{
            outer: Outer{
                nested: Inner{
                    value: 999,
                },
            },
        };
    }
}