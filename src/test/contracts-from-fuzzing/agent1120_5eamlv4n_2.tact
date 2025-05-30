struct Nested {
    inner: Int;
    optionalInner: Int?;
}

struct Container {
    nested: Nested;
    maybeNested: Nested?;
}

contract PersistDeep {
    data: Container;

    init() {
        self.data = Container{
            nested: Nested{ inner: 5, optionalInner: null },
            maybeNested: null,
        };
    }
}