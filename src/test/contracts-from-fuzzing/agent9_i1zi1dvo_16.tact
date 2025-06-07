struct OptionalNested {
    inner: Int?;
}

struct Container {
    nested: OptionalNested?;
}

contract OptionalInOptionalTest {
    data: Container;

    init() {
        self.data = Container { nested: null };
    }
}