struct NestedOptional {
    x: Int?;
    y: Bool;
}

struct Container {
    inner: NestedOptional?;
}

contract OptionalNestedTest {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}