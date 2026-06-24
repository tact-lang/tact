struct OptionalNestedInt {
    foo: Int?;
}

contract TestPersistent {
    x: OptionalNestedInt?;

    init() {
        self.x = OptionalNestedInt{ foo: 10 };
    }
}