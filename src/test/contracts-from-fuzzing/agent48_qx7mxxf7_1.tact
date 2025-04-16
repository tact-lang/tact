struct Nested {
    inner: Bool;
}

contract TestContract {
    foo: Nested;

    init() {
        self.foo = Nested{ inner: true };
    }
}
