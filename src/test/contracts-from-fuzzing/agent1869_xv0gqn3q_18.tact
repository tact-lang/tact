struct SOpt {
    a: Int?;
}

struct Container {
    inner: SOpt?;
}

contract OptionalNestedOptional {
    f: Container;

    init() {
        self.f = Container{ inner: null };
    }
}