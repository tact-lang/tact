struct Nested {
    foo: Int = 42;
}

contract TestContract {
    nested: Nested?;

    init() {
        self.nested = null;
    }
}