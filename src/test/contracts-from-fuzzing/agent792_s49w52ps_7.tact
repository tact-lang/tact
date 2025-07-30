struct Nested {
    foo: Bool;
    bar: Int?;
    baz: String?;
}

contract TestContract {
    nested: Nested?;

    init() {
        self.nested = null;
    }
}