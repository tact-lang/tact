struct Nested {
    foo: Int;
}

contract OptionalNestedDefault {
    val: Nested? = null;

    init() {
        self.val = Nested{ foo: 42 };
    }
}
