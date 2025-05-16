struct OptionalNested {
    f: Int?;
    b: Bool?;
}

struct Container {
    nested: OptionalNested?;
    flag: Bool;
}

contract OptionalNestedStructTest {
    data: Container;

    init() {
        self.data = Container{
            nested: null,
            flag: true,
        };
    }
}