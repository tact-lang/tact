struct OptionalNested {
    x: Int?;
    y: Int?;
}

struct Container {
    a: Int;
    b: OptionalNested?;
    c: OptionalNested?;
}

contract NestedOptionals {
    inner: Container;

    init() {
        self.inner = Container {
            a: 5,
            b: null,
            c: OptionalNested { x: 1, y: 2 }
        };
    }
}