struct Nested { inner: Int; }

contract TestContract {
    foo: Nested;

    init() {
        self.foo = Nested{ inner: 42 };
    }
}