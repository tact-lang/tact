struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct Container {
    id: Int;
    inner: NestedOptional?;
}

contract OptionalDeep {
    data: Container;

    init() {
        self.data = Container{
            id: 123,
            inner: null
        };
    }
}