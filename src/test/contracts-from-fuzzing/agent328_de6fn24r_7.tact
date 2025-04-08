struct OptionalNested {
    inner: Int?;
}

contract Test {
    foo: OptionalNested;
    init() {
        self.foo = OptionalNested{ inner: null };
    }
}