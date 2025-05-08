struct NestedOptionals {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructFieldTest {
    data: NestedOptionals?;

    init() {
        self.data = null;
    }
}
