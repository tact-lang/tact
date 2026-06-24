struct Nested {
    inner: Int;
}

struct Container {
    field: Nested;
}

contract TestContract {
    stored: Container;
    init() {
        self.stored = Container{field: Nested{inner: 42}};
    }
}