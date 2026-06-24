struct NestedOptions {
    optInner: Int?;
}

struct Container {
    field1: NestedOptions?;
    field2: Int;
}

contract NestedOptionsMix {
    data: Container;

    init() {
        self.data = Container{
            field1: null,
            field2: 7
        };
    }
}