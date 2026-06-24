struct Nested {
    a: Int;
    b: Int?;
}

struct Container {
    inner: Nested;
}

contract NestedStructFieldTest {
    cont: Container;
    init() {
        self.cont = Container{inner: Nested{a: 1, b: null}};
    }
}