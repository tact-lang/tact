struct Nested {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

struct Container {
    inner: Nested;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{ inner: Nested{} };
    }
}