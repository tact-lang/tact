struct NestedOptional {
    value: Int?;
    flag: Bool;
}

struct Container {
    inner: NestedOptional?;
}

contract OptionalNesting {
    data: Container;

    init() {
        self.data = Container{
            inner: null,
        };
    }
}