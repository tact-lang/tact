struct OptionalNested {
    foo: Int?;
    bar: String?;
    baz: Bool?;
}

struct Container {
    nested: OptionalNested?;
    value: Int;
}

contract OptionalNestedTest {
    state: Container = Container{
      nested: null,
      value: 42
    };

    init() {}
}
