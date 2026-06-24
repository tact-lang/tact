struct Nested {
    deep: Int;
}

struct Container {
    inner: Nested;
    flag: Bool;
}

contract DeepNestedTest {
    data: Container;

    init() {
        self.data = Container{inner: Nested{deep: 123}, flag: true};
    }
}