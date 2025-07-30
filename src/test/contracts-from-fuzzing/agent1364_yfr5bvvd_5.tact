struct NestedOptionals {
    a: Int?;
    b: Bool?;
}

struct Container {
    first: NestedOptionals?;
    second: NestedOptionals?;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            first: null,
            second: NestedOptionals{ a: 1, b: false },
        };
    }
}
