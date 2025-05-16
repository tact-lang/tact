contract OptionalDefaultsTest {
    data: Container;

    init() {
        self.data = Container{
            nested: Nested{}
        };
    }
}

struct Container {
    nested: Nested;
}

struct Nested {
    comment: String? = null;
    flag: Bool? = null;
}
