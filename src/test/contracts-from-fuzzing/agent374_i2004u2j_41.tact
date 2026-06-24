struct NestedDefault {
    foo: Int = 42;
}

contract ParamWithDefaults(
    nested: NestedDefault
) {
    receive() {
        let _ = self.nested.foo;
    }
}