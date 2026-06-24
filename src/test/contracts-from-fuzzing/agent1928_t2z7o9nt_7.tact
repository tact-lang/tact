struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    inner: OptionalNested?;
}

contract OptionalNestedTest {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}