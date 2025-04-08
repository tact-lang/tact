struct NestedOptionalDefault {
    inner: Int? = null;
}

struct Container {
    nested: NestedOptionalDefault;
}

contract OptionalDefaultTest {
    s: Container;

    init() {
        self.s = Container{
            nested: NestedOptionalDefault{}
        };
    }
}