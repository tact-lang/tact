struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    inner: NestedOptional?;
}

contract OptionalNest {
    field: Container;

    init() {
        self.field = Container{
            inner: null
        };
    }
}
