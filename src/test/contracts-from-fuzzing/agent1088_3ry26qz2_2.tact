struct NestedOptional {
    foo: Int;
    bar: Bool?;
}

contract OptionalStructTest {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}