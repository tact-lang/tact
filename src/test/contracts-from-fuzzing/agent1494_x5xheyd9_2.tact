struct OptionalNested {
    val: Int?;
}

contract OptionalNestedStructTest {
    foo: OptionalNested;

    init() {
        self.foo = OptionalNested{ val: null };
    }
}
