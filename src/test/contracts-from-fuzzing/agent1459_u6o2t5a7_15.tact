struct NestedOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct Container {
    nested: NestedOptionals?;
    val: Int;
}

contract OptionalOptionalTest {
    state: Container;

    init() {
        self.state = Container{
            nested: null,
            val: 5
        };
    }
}
